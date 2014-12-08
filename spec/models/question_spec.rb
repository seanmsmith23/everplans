require 'rails_helper'

describe Question do
  it "should validate uniqueness" do
    Question.create(name: "One", questionnaire_id: 1)
    Question.create(name: "One", questionnaire_id: 1)

    expect(Question.all.count).to eq(1)
  end
end