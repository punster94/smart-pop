class University < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :teachers
  has_many :courses, through: :teachers
  
  def self.create(params)
    @university = University.new(params)
    @university.save
  end
end