class StudentCoursePairing < ActiveRecord::Base
  belongs_to :student, dependent: :destroy
  belongs_to :course, dependent: :destroy
  def validate
    self.validated = true
    self.save
  end
  
  def enrollment_code
  end
end