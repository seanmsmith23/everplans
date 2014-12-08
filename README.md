README
======

**Everplans Code Challenge**

This README will outline the setup and thought processes behind my solution for the Everplans code challenge.

Setup:

* run `bundle install`
* run `rake db:create`
* run `rake db:migrate`
* run `rake db:seed`
* start your server with `rails s`

Outline:

* Styling was done with Bourbon. Bourbon was also used to create a custom grid, as seen in application.css.scss.
* The app primarily uses fairly standard Rails practices, RESTful routes, ERB/server-side HTML, etc...
* JavaScript was used to dynamically add questions when creating a questionnaire and to ensure there were no blank fields before submitting a form.
* Testing was done with Rspec/Capybara and Selenium WebDriver. I wrote mostly acceptance tests, with a few model tests to check validations.

Outstanding issues, future improvements:

* Styling when viewing responses (very bland at the moment).
* Lambda for rejecting blank questions (for `accepts_nested_attributes` on `Questionnaire` model).
* Can view responses for a single questionnaire.
* Test controller logic for adding nested_attributes in `questionnaires_controller.rb`.
* Test controller logic for multiple response creation in `responses_controller.rb`.

