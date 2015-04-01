class Teacher < ActiveRecord::Base
  has_one :user, dependent: :destroy
  def self.create(params)
    @teacher = Teacher.new(params)
    @teacher.save
  end
end