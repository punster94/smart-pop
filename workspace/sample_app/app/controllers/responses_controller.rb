class ResponsesController < ApplicationController
  include SessionsHelper
  before_action :student_only, only: [:new, :create]
  def new
    @response = Response.new
  end
  
  def create
    @response = Response.new(params[:response])
    @response.question_id = params[:question_id]
    @response.save
    redirect_to "/quizzes/#{Question.find(@response.question_id).quiz.id}/take"
  end
  
  def edit
    @response = Response.find(params[:id])
  end
  
  def update
    @response = Response.find(params[:id])
    @response.update_attributes(params[:response])
    redirect_to "/quizzes/#{Question.find(@response.question_id).quiz.id}/take"
  end
end