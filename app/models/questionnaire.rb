class Questionnaire < ActiveRecord::Base
  has_many :questions

  accepts_nested_attributes_for :questions

  validates :name, :uniqueness => true
end
