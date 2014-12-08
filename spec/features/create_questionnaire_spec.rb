require 'rails_helper'

feature "Questionnaires" do
  scenario "Home page should have link that takes user to a page for creating new questionnaires" do
    visit '/'

    expect(page).to have_link("New Questionnaire")

    click_link("New Questionnaire")

    expect(page).to have_content("Create New Questionnaire")
  end
end