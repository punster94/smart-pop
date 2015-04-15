class MultipleChoiceOptionController < ApplicationController
  include SessionsHelper
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
  
  private
  
  def multiple_choice_option_params
    params.require(:multiple_choice_option).permit(:question_id, :description)
  end
end