class Teacher < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :university
  has_many :courses
  has_many :student_course_pairings, through: :courses

  def self.create(params)
    @teacher = Teacher.new(params)
    @teacher.save
  end
  
  def verified_pairings
    self.student_course_pairings.where(validated: true)
  end
end