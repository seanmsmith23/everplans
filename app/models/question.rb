class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :responses

  accepts_nested_attributes_for :responses

  validates :name, uniqueness: true
end
