class MultipleChoiceOption < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :description
  
  validates :description, presence: true
  
  def number_of_responses
    question.responses.where(multiple_choice_answer: id).size
  end
end