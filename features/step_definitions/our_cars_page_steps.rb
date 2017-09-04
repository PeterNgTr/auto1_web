When(/^I visit the (.*)$/) do |page|
  visit_page_and_count_time(page)
end

When(/^I filter the cars by (.*)$/) do |manufacture|
  on(OurCarsPage).filter_by(manufacture)
end

Then(/^filter by (.*) is selected$/) do |manufacture|
  on(OurCarsPage).wait_until { @current_page.loaded? }
  expect(on(OurCarsPage).value_is_chosen?(manufacture)).to be true
end

Then(/^all cars in result contains (.*)$/) do |manufacture|
  expect(on(OurCarsPage)).to have_matched_filter_by(manufacture)
end

Then(/^all cars in result have picture/) do
  expect(on(OurCarsPage)).to have_image
end

Then(/^all cars in result have complete info/) do
  expect(on(OurCarsPage)).to have_complete_info
end




