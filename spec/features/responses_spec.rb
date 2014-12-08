require 'rails_helper'

feature "Adding a response" do
  scenario "User can add a response to a questionnaire" do
    @questionnaire = create_questionnaire

    visit '/'

    expect(page).to have_link(@questionnaire.name)

    click_link(@questionnaire.name)

    first = @questionnaire.questions.first
    last = @questionnaire.questions.last

    expect(page).to have_content(first.name)
    expect(page).to have_content(last.name)

    fill_in "question_#{first.id}", with: "First Answer"
    fill_in "question_#{last.id}", with: "Second Answer"
    click_button "Submit Response"

    expect(page).to have_content("Thank you for your response!")
  end
end