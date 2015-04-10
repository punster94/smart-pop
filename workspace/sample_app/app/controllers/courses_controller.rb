class CoursesController < ApplicationController
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    @course.teacher_id = User.find(params[:user][:id]).account.id
    if @course.save
      render 'show'
    else
      render 'new'
    end
  end
  
  private

    def course_params
      params.require(:course).permit(:course_name, :course_number, :section_number, :enrollment_code)
    end
end
