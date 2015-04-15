class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :multiple_choice_options, dependent: :destroy
  accepts_nested_attributes_for :multiple_choice_options, allow_destroy: true
  attr_accessible :multiple_choice_options_attributes, :question_text, :type, :multiple_choice_answer, :input_text_answer, :quiz_id
  
  validates :question_text, presence: true
  validates :multiple_choice_answer, presence: true # take this out when other question types are implemented
  
  def self.types
    [ 'Multiple Choice', 'Short Answer' ]
  end
  
  def correct_multiple_choice_option
    self.multiple_choice_options.where(description: multiple_choice_answer).first
  end
end