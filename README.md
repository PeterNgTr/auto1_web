# Auto1 Web 

###*QA Assignment*

Use Case 3: “Our cars” 

Using any test automation framework and any programming language (except play record tools), please do following:

1. Open https://auto1.com/en/our-cars
2. Filter by manufacture by clicking checkbox(BMW)
3. Verify filter was selected
4. Verify all cars are BMW’s on the page
5. Verify each car has picture
6. Verify each car has complete information (Mileage, Registration is not empty etc.)


This automation task uses Watir Webdriver (Selenium) and follows Page Object pattern.

We could add more TCs by adding related TCs to *.feature files. 

For debug purpose, this quite easy to do so, you can either 

. *Adding this line to anywhere you want to debug*
```ruby
binding.pry
```

. *If using any IDE, such as RubyMine, putting an breakpoint and executing as debug mode*

###*Project Layout*

* config/config.yml : Data set
* features/*.feature : cucumber features
* features/step_definitions/steps.rb : generic steps that apply to all features
* features/support/env.rb : configures gems to use
* features/support/pages : the pages which are related to automation tests
* failuretracker: stores the info (screenshot/html file) when any TC is failed

###*Prerequisites*

* Ruby http://www.ruby-lang.org/en/downloads/
* Ruby Gems http://rubygems.org/
* Bundler: 
```ruby
gem install bundler rake
```

###*Configuration*
```ruby
bundle install
```
###*Running Features*

To run a specific feature, for instance: homepage.feature, you can either:

. *Using terminal: after navigating to auto1_web/ directory*
```
cucumber features/our_cars.feature
```

. *Using IDE such as RubyMine, click on search.feature file and choose "Run our_cars.feature" on the context menu*
