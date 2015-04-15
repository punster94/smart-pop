class QuizzesController < ApplicationController
  include SessionsHelper
  before_action :teacher_only, only: [:new, :create, :edit, :update, :manual_start, :manual_end]
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
  
  def edit
    @quiz = Quiz.find(params[:id])
  end
  
  def manual_start
    @quiz = Quiz.find(params[:id])
    @quiz.start_time = DateTime.now
    if @quiz.end_time < DateTime.now
      @quiz.end_time = DateTime.now + 30.minutes
      flash[:success] = "Thirty minutes added to duration of unplanned quiz."
    else
      flash[:success] = "Quiz Started!"
    end
    @quiz.save
    redirect_to "/courses/#{@quiz.course_id}"
  end
  
  def manual_end
    @quiz = Quiz.find(params[:id])
    @quiz.end_time = DateTime.now
    @quiz.save
    flash[:success] = "Quiz Ended."
    redirect_to "/courses/#{@quiz.course_id}"
  end
  
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(params[:quiz])
      redirect_to "/courses/#{@quiz.course_id}"
    else
      render 'edit'
    end
  end
end