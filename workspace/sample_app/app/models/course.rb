class Course < ActiveRecord::Base
  def pairings
    StudentCoursePairing.where(course_id: id)
  end
  
  def students
    @students ||= find_students
  end
  
  private
  
  def find_students
    student_list = []
    pairings.each do |p|
      student_list.push(Student.find(p.student_id))
    end
    @students = student_list
  end
end