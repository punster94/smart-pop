class StudentCoursePairing < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  
  def validate
    self.validated = true
    self.save
  end
  
  def enrollment_code
  end
end