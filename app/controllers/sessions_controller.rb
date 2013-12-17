class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      log_in_user!(@user)
      redirect_to new_session_url
    else
      @user = User.new
      flash.now[:errors] ||= []
      flash.now[:errors] << "Invalid email or password"
      render :new
    end
  end

  def destroy
    log_out!
  end
end