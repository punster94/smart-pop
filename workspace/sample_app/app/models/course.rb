class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :student_course_pairings, dependent: :destroy
  has_many :students, through: :student_course_pairings
  
  validates :course_name, presence: true
  validates :course_number, presence: true
  validates :section_number, presence: true
  validates :enrollment_code, presence: true
  
  attr_accessible :teacher_id, :course_name, :course_number, :section_number, :enrollment_code, :teacher_name
  
  def verified
    self.student_course_pairings.where(validated: true)
  end
end