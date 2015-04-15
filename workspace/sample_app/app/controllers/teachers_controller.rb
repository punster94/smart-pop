class TeachersController < ApplicationController
  include SessionsHelper
  before_action :university_only, only: [:verify]
  before_action :teacher_only, only: [:register, :show]
  
  def verify
    @teacher = Teacher.find(params[:teacher_id])
    @teacher.validated = true
    if @teacher.save
      flash[:success] = "Teacher Verified!"
    else
      flash[:error] = "Verification Failed."
    end
    redirect_to '/verify'
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
    redirect_to '/teachers/register'
  end
  
  def show
    @teacher = current_user.account
  end
  
end