class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :course
  belongs_to :teacher
  accepts_nested_attributes_for :questions, allow_destroy: true
  attr_accessible :questions_attributes, :teacher_id, :start_time, :end_time, :course_id, :title
  
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end