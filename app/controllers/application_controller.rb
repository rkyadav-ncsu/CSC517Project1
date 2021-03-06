class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login
  private
  def require_login
    unless logged_in?
      puts "Current user is " + current_user.id
      flash.now[:danger] = "You must be logged in to continue"
      redirect_to root_url
    end
  end
  include SessionsHelper
end
