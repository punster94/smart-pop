class Response < ActiveRecord::Base
  attr_accessible :question_id, :student_id, :multiple_choice_answer, :text_answer
end