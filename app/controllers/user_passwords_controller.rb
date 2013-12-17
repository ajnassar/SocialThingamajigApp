class UserPasswordsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      PasswordMailer.password_reset(user).deliver!
      redirect_to new_session_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "not a valid email"
      render :new
    end
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
