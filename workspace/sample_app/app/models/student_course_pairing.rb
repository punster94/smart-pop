class StudentCoursePairing < ActiveRecord::Base
  
  def validate
    self.validated = true
    self.save
  end
end