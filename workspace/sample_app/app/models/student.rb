class Student < ActiveRecord::Base
  has_one :user, dependent: :destroy
  def self.create(params)
    @student = Student.new(params)
    @student.save
  end
  
  def pairings
    StudentCoursePairing.where(student_id: id)
  end
  
  def courses
    @courses ||= find_courses
  end
  
  private
  
  def find_courses
    @courses = Course.select{ |c| !pairings.where(course_id: c.id).blank? }
  end
end