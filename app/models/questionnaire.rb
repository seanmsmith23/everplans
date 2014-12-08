class Questionnaire < ActiveRecord::Base
  has_many :questions
  has_many :responses, through: :questions

  accepts_nested_attributes_for :questions

  validates :name, uniqueness: true
  validates :name, presence: true
end
