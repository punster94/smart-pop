class ResponseContainersController < ApplicationController
  include SessionsHelper
  before_action :student_only, only: [:new, :create, :edit, :update]
  before_action :after_quiz, only: [:show]
  def new
    @response_container = ResponseContainer.new
  end
  
  def show
    @response_container = ResponseContainer.find(params[:id])
  end
  
  def create
    @response_container = ResponseContainer.new(params[:response_container])
    @response_container.student_id = current_user.account.id
    @response_container.quiz_id = params[:quiz_id]
    @response_container.save
    params[:response_container][:response].each_with_index do |response, index|
      res = Response.new()
      res.multiple_choice_answer = response[1]['multiple_choice_answer']
      res.question_id = params["#{index}_question_id".to_s]
      res.response_container_id = @response_container.id
      res.save if res.multiple_choice_answer
    end
    flash[:success] = "Responses Submitted!"
    redirect_to @response_container.quiz.course
  end
  
  def edit
    @response_container = ResponseContainer.find(params[:id])
  end
  
  def update
    @response_container = ResponseContainer.find(params[:id])
    @response_container.update_attributes(params[:response_container])
    params[:response_container][:response].each_with_index do |response, index|
      res = Response.where(response_container_id: params[:id], question_id: params["#{index}_question_id".to_s]).first
      res.multiple_choice_answer = response[1]['multiple_choice_answer']
      res.save if res.multiple_choice_answer
    end
    flash[:success] = "Responses Updated!"
    redirect_to @response_container.quiz.course
  end
  
  private
    
    def after_quiz
      rc = ResponseContainer.find(params[:id])
      quiz = rc.quiz
      Time.zone = "America/New_York"
      now = Time.zone.utc_to_local(DateTime.now)
      unless (quiz.end_time < now && current_user.account.id == rc.student_id) || (current_user.account.class == Teacher && current_user.id == quiz.teacher.user.id)
        flash[:error] = "Not permitted to view results."
        redirect_to(root_url) 
      end
    end
end