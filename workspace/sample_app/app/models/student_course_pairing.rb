class StudentCoursePairing < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  attr_accessible :student_id, :course_id, :validated
  
  def validate
    self.validated = true
    self.save
  end
  
  def enrollment_code
  end
end