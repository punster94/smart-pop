class Student < ActiveRecord::Base
  has_one :user, dependent: :destroy
  def self.create(params)
    @student = Student.new(params)
    @student.save
  end
end