class SessionsController < ApplicationController
  skip_before_filter :redirect_unless_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
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