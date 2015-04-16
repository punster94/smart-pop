class MultipleChoiceOption < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :description
  
  validates :description, presence: true
end