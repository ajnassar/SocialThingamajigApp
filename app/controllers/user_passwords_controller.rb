class UserPasswordsController < ApplicationController
  def new
  end

  def create
  end

  def update
    current_user.reset_password!(params[:user][:password])
    redirect_to new_session_url
  end

  def edit
    @user = User.find_by_password_reset_token(params[:password_reset_token])

    log_in_user!(@user)
    puts "------------------------------------"
    puts current_user.email
    render :edit
  end
end
