# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.destroy_all
Questionnaire.destroy_all
Response.destroy_all

questionnaire = Questionnaire.create(
  name: "User Feedback Survey"
)

first = Question.create(
  name: "How was your overall experience with the app?",
  label: "Just provide your general feelings, nothing too in depth.",
  questionnaire_id: questionnaire.id
)

second = Question.create(
  name: "How much do you think you would pay for this service?",
  label: "Try and provide a dollar figure.",
  questionnaire_id: questionnaire.id
)

Response.create(
  name: "Sean Smith",
  question_id: first.id,
  answer: "The application was great, what an awesome service!"
)

Response.create(
  name: "Sean Smith",
  question_id: second.id,
  answer: "Probably nothing, do I look like a chump?"
)

Response.create(
  name: "Jay-Z",
  question_id: first.id,
  answer: "Not a big fan. The UX was way off, I could do a better job."
)

Response.create(
  name: "Jay-Z",
  question_id: second.id,
  answer: "Yeah, why not. I'm loaded."
)

p "Seeds loaded... run 'rails s' to start your server."