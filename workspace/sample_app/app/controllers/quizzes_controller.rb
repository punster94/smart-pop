class QuizzesController < ApplicationController
  include SessionsHelper
  before_action :teacher_only, only: [:new, :create]
  def new
    @quiz = Quiz.new
    @quiz.course_id = params[:course_id]
  end
  
  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.teacher_id = current_user.account.id
    @quiz.course_id = params[:course_id]
    
    if @quiz.save
      flash[:success] = "Quiz Created!"
      redirect_to "/courses/#{@quiz.course_id}"
    else
      flash[:error] = "Quiz creation failed."
      render 'new'
    end
  end
end