def question_field(num)
  "questionnaire[questions_attributes][#{num}][name]"
end

def questionnaire_success
  "Questionnaire created successfully!"
end

def create_questionnaire(overrides={})
  default = { name: "User Feedback", questions: ["First", "Second"] }.merge(overrides)
  @questionnaire = Questionnaire.create(name: default[:name])

  default[:questions].each do |question|
    Question.create(questionnaire_id: @questionnaire.id, name: question)
  end
  @questionnaire
end