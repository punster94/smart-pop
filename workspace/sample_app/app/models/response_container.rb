class ResponseContainer < ActiveRecord::Base
  belongs_to :quiz, dependent: :destroy
  belongs_to :student, dependent: :destroy
  has_many :responses, dependent: :destroy
  attr_accessible :quiz_id, :student_id, :responses_attributes
  accepts_nested_attributes_for :responses, allow_destroy: true
end