class StudentCoursePairingsController < ApplicationController
  include SessionsHelper
  def new
    @student_course_pairing = StudentCoursePairing.new
    @student_course_pairing.student_id = current_user.account.id
    @student_course_pairing.course_id = params[:course_id]
    unless StudentCoursePairing.where(student_id: current_user.account.id, course_id: params[:course_id]).blank?
      flash[:error] = "You are already signed up for this course!"
      redirect_to '/courses'
    end
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
    scp = StudentCoursePairing.where(course_id: params[:course_id], student_id: current_user.account.id).first
    if scp.delete
      flash[:success] = "Course removed."
    else
      flash[:error] = "Pairing does not exist."
    end
    redirect_to current_user
  end
  
  def create
    @student_course_pairing = StudentCoursePairing.new
    @student_course_pairing.student_id = current_user.account.id
    @student_course_pairing.course_id = params[:course_id]
    if params[:student_course_pairing][:enrollment_code] == Course.find(params[:course_id]).enrollment_code
      if @student_course_pairing.save
        flash[:success] = "You are now registered for the course!"
        redirect_to "/users/#{current_user.id}"
      else
        redirect_to "/student_course_pairings/new/#{params[:course_id]}"
      end
    else
      flash[:error] = "Incorrect enrollment code."
      redirect_to "/student_course_pairings/new/#{params[:course_id]}"
    end
  end
  
  private

    def student_course_pairing_params
      params.permit(:course_id, :validated, :enrollment_code)
    end
end
