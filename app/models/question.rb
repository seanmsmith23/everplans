class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :responses

  validates :name, uniqueness: true
end
