class QuestionsController < ApplicationController
  include SessionsHelper
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(quiz_params)
    @question.type = 'Multiple Choice'
    @question.save
  end
  
  private
  
  def question_params
    params.require(:question).permit(:question_text, :quiz_id, :type, :multiple_choice_answer, :input_text_answer, :course_id)
  end
end