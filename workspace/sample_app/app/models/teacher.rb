class Teacher < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :courses

  def self.create(params)
    @teacher = Teacher.new(params)
    @teacher.save
  end

end