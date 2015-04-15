class MultipleChoiceOption < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :description
end