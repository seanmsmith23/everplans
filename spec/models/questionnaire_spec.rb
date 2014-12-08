require 'rails_helper'

describe Questionnaire do
  it "should validate uniqueness of name" do
    Questionnaire.create(name: "Something")
    Questionnaire.create(name: "Something")

    expect(Questionnaire.all.count).to eq(1)
  end

  it "should validate presence of name" do
    Questionnaire.create(name: "")

    expect(Questionnaire.all.count).to eq(0)
  end
end