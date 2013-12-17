class UsersController < ApplicationController
  skip_before_filter :redirect_unless_logged_in, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors]=@user.errors.full_messages
      render :new
    end
  end
end
