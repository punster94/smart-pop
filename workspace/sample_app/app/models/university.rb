class University < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :teachers
  has_many :courses, through: :teachers
  attr_accessible :user_id
  def self.create(params)
    @university = University.new(params)
    @university.save
  end
end