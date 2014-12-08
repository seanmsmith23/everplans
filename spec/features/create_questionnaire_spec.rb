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
    fill_in description_field(0), with: "First decrip"

    click_link "Add Question"

    fill_in question_field(1), with: "Second question?"
    fill_in description_field(1), with: "Second decrip"


    click_button "Create Questionnaire"

    expect(page).to have_content(questionnaire_success)
  end

  scenario "It should disable the button unless all fields are filled", js: true do
    visit new_questionnaire_path

    expect(page).to_not have_button("Create Questionnaire")

    fill_in "questionnaire[name]", with: "Something"
    fill_in question_field(0), with: "Something Else"
    fill_in description_field(0), with: "First decrip"

    expect(page).to have_button("Create Questionnaire")

    click_link("Add Question")

    expect(page).to_not have_button("Create Questionnaire")

    fill_in question_field(1), with: "Second Thing"
    fill_in description_field(1), with: "Second decrip"

    expect(page).to have_button("Create Questionnaire")
  end
end