class Teacher < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :university
  has_many :courses, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  has_many :student_course_pairings, through: :courses
  attr_accessible :user_id, :validated, :university_id
  def self.create(params)
    @teacher = Teacher.new(params)
    @teacher.save
  end
  
  def verified_pairings
    self.student_course_pairings.where(validated: true)
  end
end