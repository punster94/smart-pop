class MultipleChoiceOptionController < ApplicationController
  include SessionsHelper
  before_action :teacher_only, only: [:new, :create, :edit, :update]
  def new
    @multiple_choice_option = MultipleChoiceOption.new
  end
  
  def create
    @multiple_choice_option = MultipleChoiceOption.new(multiple_choice_option_params)
    if params[:course_id]
      @multiple_choice_option.course_id = params[:course_id]
    else
      @multiple_choice_option.course_id = nil
    end
    @multiple_choice_option.save
  end
  
  def edit
    @multiple_choice_option = MultipleChoiceOption.find(params[:id])
  end
  
  def update
    @multiple_choice_option = MultipleChoiceOption.find(params[:id])
    @multiple_choice_option.update_attributes(multiple_choice_option_params)
  end
  
  private
  
  def multiple_choice_option_params
    params.require(:multiple_choice_option).permit(:question_id, :description)
  end
end