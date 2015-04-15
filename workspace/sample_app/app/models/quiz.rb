class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  attr_accessible :questions_attributes, :teacher_id, :start_time, :end_time, :course_id
end