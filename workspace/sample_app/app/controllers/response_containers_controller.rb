class ResponseContainersController < ApplicationController
  include SessionsHelper
  before_action :student_only, only: [:new, :create, :edit, :update]
  def new
    @response_container = ResponseContainer.new
  end
  
  def create
    binding.pry
    @response_container = ResponseContainer.new(params[:response_container])
    @response_container.student_id = current_user.account.id
    @response_container.quiz_id = params[:quiz_id]
    @response_container.save
    flash[:success] = "Responses submitted!"
    redirect_to @response_container.quiz.course
  end
  
  def edit
    @response_container = ResponseContainer.find(params[:id])
  end
  
  def update
    @response_container = ResponseContainer.find(params[:id])
    @response_container.update_attributes(params[:response_container])
  end
end