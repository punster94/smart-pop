class TeachersController < ApplicationController
  include SessionsHelper
  before_action :university_only, only: [:verify]
  before_action :teacher_only, only: [:register]
  
  def verify
    @student_course_pairing = StudentCoursePairing.find(params[:id])
    @student_course_pairing.validate
    redirect_to '/student_course_pairings'
  end
  
  def register
    @teacher = current_user.account
    @teacher.university_id = params[:university_id]
    @teacher.validated = false
    if @teacher.save
      flash[:success] = "Registered under university!"
    else
      flash[:error] = "Registration failed."
    end
    redirect_to 'register_university'
  end
  
end