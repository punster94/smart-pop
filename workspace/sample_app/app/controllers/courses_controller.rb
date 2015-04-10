class CoursesController < ApplicationController
  include SessionsHelper
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    @course.teacher_id = current_user.account.id
    university_courses = current_user.account.university.courses
    if university_courses.where(course_number: @course.course_number, section_number: @course.section_number).blank?
      if @course.save
        flash[:success] = "Course Created!"
        redirect_to "/users/#{current_user.id}"
      else
        render 'new'
      end
    else
      flash[:error] = "A course with this course number and section number already exists"
      render 'new'
    end
  end
  
  private

    def course_params
      params.require(:course).permit(:course_name, :course_number, :section_number, :enrollment_code)
    end
end
