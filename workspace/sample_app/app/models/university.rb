class University < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  
  def self.create(params)
    @university = University.new(params)
    @university.save
  end
end