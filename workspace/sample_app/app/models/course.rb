class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :student_course_pairings
  has_many :students, through: :student_course_pairings
end