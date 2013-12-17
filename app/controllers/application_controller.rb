class ApplicationController < ActionController::Base
  include SessionsHelper
  # protect_from_forgery

  before_filter :redirect_unless_logged_in


end
