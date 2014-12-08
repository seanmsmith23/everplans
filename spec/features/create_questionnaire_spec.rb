require 'rails_helper'

feature "Questionnaires" do
  scenario "Home page should have link that takes user to a page for creating new questionnaires" do
    visit '/'

    expect(page).to have_link("New Questionnaire")

    click_link("New Questionnaire")

    expect(page).to have_content("Create New Questionnaire")
    expect(page).to have_button("Create Questionnaire")
  end

  scenario "Questionnaire name must be unique and shows flash success" do
    visit new_questionnaire_path

    fill_in "questionnaire[name]", with: "Feedback"
    click_button "Create Questionnaire"

    expect(page).to have_content(questionnaire_success)

    visit new_questionnaire_path

    fill_in "questionnaire[name]", with: "Feedback"
    click_button "Create Questionnaire"

    expect(page).to have_content("Name has already been taken")
  end

  scenario "User can dynamically add questions to questionnaire", js: true do
    visit new_questionnaire_path

    fill_in "questionnaire[name]", with: "Feedback"
    fill_in question_field(0), with: "First question?"

    click_link "Add Question"

    fill_in question_field(1), with: "Second question?"

    click_button "Create Questionnaire"

    expect(page).to have_content(questionnaire_success)
  end
end