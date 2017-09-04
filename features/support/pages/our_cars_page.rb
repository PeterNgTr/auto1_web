class OurCarsPage
  include PageObject

  OURCARSPAGE_URL ||= Fixtures['urls.base'] + Fixtures['urls.our_cars']

  div(:filter_section, css: 'div[class="filters-box"]')
  spans(:manufactures, css: 'li[data-action="car:search"] span')
  divs(:car_name_results, css: 'div[class="car-name"]')
  divs(:car_img_results, css: 'div[class="car-img"] img')
  div(:loading, class: 'loading-ticker')
  tables(:car_info, css: 'div[class="car-info"] tbody')

  page_url(OURCARSPAGE_URL)

  def loaded?
    wait_until { filter_section_element.visible? }
    filter_section_element.visible?
  end

  def filter_by(manufacture = 'bmw')
    manufactures_elements.each do |m|
      m.click if m.attribute_value('class').downcase.include?(manufacture.downcase)
    end
  end

  def value_is_chosen?(manufacture = 'bmw')
    manufactures_elements.each do |m|
      return m.parent.attribute_value('class').downcase.include?('checked') if m.attribute_value('class').downcase.include?(manufacture.downcase)
    end
  end

  def has_matched_filter_by?(manufacture = 'bmw')
    wait_until { !loading_element.visible? }
    car_name_results_elements.all? {|name| name.text.downcase.include?(manufacture.downcase)}
  end

  def has_image?
    wait_until { !loading_element.visible? }
    car_img_results_elements.all? {|img| img.attribute_value('src').downcase.include?('.jpeg')}
  end

  def has_complete_info?
    wait_until { !loading_element.visible? }
    car_info_elements.each do |item|
      item.count == 7 && item.all? { |i| !i.text.downcase.match(/(\S+): (\S+)/).nil? }
  end

  end

end
