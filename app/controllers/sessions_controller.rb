class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user and return
    end
  else
    flash.now[:danger] = "Incorrect email/password"
    render 'new'
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
