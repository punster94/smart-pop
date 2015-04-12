class StudentCoursePairingsController < ApplicationController
  include SessionsHelper
  def new
    @student_course_pairing = StudentCoursePairing.new
  end
  
  def update
    @student_course_pairing = StudentCoursePairing.find(params[:id])
    if @student_course_pairing.update_attributes(student_course_pairing_params)
      redirect_to @student_course_pairing
    else
      render @student_course_pairing.course
    end
  end
  
  def destroy
    StudentCoursePairing.find(params[:id]).destroy
    redirect_to current_user
  end
  
  def create
    @student_course_pairing = StudentCoursePairing.new(student_course_pairing_params)
    @student_course_pairing.student_id = current_user.account.id
    @student_course_pairing.course_id = params[:course_id]
    if StudentCoursePairing.where(student_id: @student_course_pairing.student_id, course_id: @student_course_pairing.course_id).blank?
      if params[:enrollment_code] == Course.find(params[:course_id]).enrollment_code
        if @student_course_pairing.save
          flash[:success] = "You are now registered for the course!"
          redirect_to "/users/#{current_user.id}"
        else
          render nothing: true
        end
      else
        flash[:error] = "Incorrect enrollment code."
      end
    else
      flash[:error] = "You are already signed up for this course!"
      render nothing: true
    end
  end
  
  private

    def student_course_pairing_params
      params.permit(:course_id, :validated, :enrollment_code)
    end
end
