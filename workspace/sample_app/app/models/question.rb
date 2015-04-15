class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :multiple_choice_options, dependent: :destroy
  accepts_nested_attributes_for :multiple_choice_options, allow_destroy: true
  attr_accessible :multiple_choice_options_attributes, :question_text, :type, :multiple_choice_answer, :input_text_answer, :quiz_id
  def self.types
    [ 'Multiple Choice', 'Short Answer' ]
  end
end