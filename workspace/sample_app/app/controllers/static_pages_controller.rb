class StaticPagesController < ApplicationController
  def home
    redirect_to User.find(current_user.id) if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
