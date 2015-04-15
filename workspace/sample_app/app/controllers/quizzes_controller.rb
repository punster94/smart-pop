class QuizzesController < ApplicationController
  include SessionsHelper
  def new
    @quiz = Quiz.new
  end
end