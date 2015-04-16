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
  
  def take
    @quiz = Quiz.find(params[:id])
    @response_container = ResponseContainer.where(quiz_id: @quiz.id, student_id: current_user.account.id).first
    @response_container = ResponseContainer.new unless @response_container
    Time.zone = "America/New_York"
    now = Time.zone.utc_to_local(DateTime.now)
    if now > @quiz.end_time || now < @quiz.start_time
      flash[:error] = "Unable to take quiz at this time."
      redirect_to current_user 
    end
  end
  
  def manual_start
    Time.zone = "America/New_York"
    @quiz = Quiz.find(params[:id])
    @quiz.start_time = Time.zone.utc_to_local(DateTime.now) - 5.seconds
    if @quiz.end_time < Time.zone.utc_to_local(DateTime.now)
      @quiz.end_time = Time.zone.utc_to_local(DateTime.now) + 30.minutes
    else
      flash[:success] = "Quiz Started!"
    end
    @quiz.save
    redirect_to "/courses/#{@quiz.course_id}"
  end
  
  def manual_end
    Time.zone = "America/New_York"
    @quiz = Quiz.find(params[:id])
    @quiz.end_time = Time.zone.utc_to_local(DateTime.now) - 5.seconds
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