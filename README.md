# Week 10 - Claude St-Laurent

# Quality and Test Driven Development

 <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo" width="80" height="">

* [Link for the TDD Repo](https://github.com/Surveytech/Rocket_Elevators-TDD.git)
* [URL for my site](https://claudestlaurent.xyz)
* [Video link](https://youtu.be/)

## Works done this week
- <ins>Gems added</ins>
- <ins>API's tested</ins>
- <ins>Elements tested in the Rails app</ins>



### 1 - <ins>Gems Added</ins> <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="Rocket Elevators logo" width="50" height="">

 Here's the list of the gems installed this week to help us with the TDD work

* gem 'rspec-rails'
      https://github.com/rspec/rspec-rails

* gem 'capybara'
      https://github.com/teamcapybara/capybara

* gem 'simplecov'
      https://github.com/simplecov-ruby/simplecov


### 2 - <ins>APIs tested</ins>  <img src="app/assets/images/rapidapi.png" align="right" alt="Rocket Elevators logo" width="150" height="">

Those are the 2 API in my *streamer.rb* file that I tested with the *streamer_spec.rb*
* [Open Weather Map API from RapidApi](https://rapidapi.com/community/api/open-weather-map/endpoints)

* [Yahoo Finance API from RapidApi](https://rapidapi.com/apidojo/api/yahoo-finance1?endpoint=apiendpoint_33e0cec5-0f8a-4f9f-a6dc-018e6762fbe7)

The streamer.rb include a class Streamer who is in ElevatorMedia module.<br> 
All test execute with the **_steamer_spec.rb_** pass thru the <ins>***getcontent*** method</ins> in the **_streamer.rb_**, and return html included in a div

### 3 - <ins>Rails App elements tested</ins>

Those App elements were also tested 

* New file streamer.rb (2 Api) with test in streamer_spec.rb
  * check if the weather app exist
  * check if the city equal Berlin
  * check if stockquote return a symbol
  * check if the return as a div in it
* intervention_controller.rb with test in intervention_controller_spec.rb
  * test some content in the table
  * check the http response
  * check if there's an author_id
  * check if there's a report in the table
* leads_controller.rb with test in leads_controller_spec.rb
  * check if the Lead.new() works
  * check if there's a full name in the lead
* application_controller.rb with test in the application_controller_spec.rb
  * check if the login works
  * test admin access via /admin
  * check if the /interventions route exist
* elevator model with test in the elevator_spec.rb
  * check the updated_at
  * check if elevator is created



<div style="text-align: right"><i>Readme created by Claude St-Laurent</i></div>

















