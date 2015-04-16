class Response < ActiveRecord::Base
  belongs_to :question, dependent: :destroy
  belongs_to :response_container, dependent: :destroy
  has_one :quiz, through: :response_container
  has_one :student, through: :response_container
  attr_accessible :question_id, :response_container_id, :multiple_choice_answer, :text_answer, :student_id
  validates :multiple_choice_answer, presence: true
  
  def multiple_choice_option
    MultipleChoiceOption.find(multiple_choice_answer)
  end
end