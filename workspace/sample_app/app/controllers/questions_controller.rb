class QuestionsController < ApplicationController
  include SessionsHelper
  before_action :teacher_only, only: [:new, :create, :edit, :update]
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(quiz_params)
    @question.type = 'Multiple Choice'
    @question.save
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
  end
  
  private
  
  def question_params
    params.require(:question).permit(:question_text, :quiz_id, :type, :multiple_choice_answer, :input_text_answer, :course_id)
  end
end