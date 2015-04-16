class UniversitiesController < ApplicationController
  include SessionsHelper
  before_action :university_only, only: [:verify]
  def verify
  end
end