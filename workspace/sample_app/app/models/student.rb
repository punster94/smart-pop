class Student < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :student_course_pairings, dependent: :destroy
  has_many :courses, through: :student_course_pairings
  
  def self.create(params)
    @student = Student.new(params)
    @student.save
  end
  
end