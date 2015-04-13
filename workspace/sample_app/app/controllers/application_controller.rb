class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private  
    def logged_in_user
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to '/'
      end
    end
     
    def teacher_only
      redirect_to(root_url) unless current_user.account.class == Teacher
    end
  
    def university_only
      redirect_to(root_url) unless current_user.account.class == University
    end
end
