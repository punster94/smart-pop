class University < ActiveRecord::Base
  has_one :user, dependent: :destroy
  def self.create(params)
    @university = University.new(params)
    @university.save
  end
end