class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :student_course_pairings
  has_many :students, through: :student_course_pairings
  
  validates :course_name, presence: true
  validates :course_number, presence: true
  validates :section_number, presence: true
  validates :enrollment_code, presence: true
end