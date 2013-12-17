class FriendCirclesController < ApplicationController
  def show
    @friend_circle = FriendCircle.find(params[:id])
  end

  def index
  end

  def new
    @friend_circle = FriendCircle.new
  end

  def create
    params[:friend_circle][:user_id] = current_user.id
    @friend_circle = FriendCircle.new(params[:friend_circle])
    if @friend_circle.save
      flash[:notice]="new friend circle created!"
      redirect_to friend_circle_url(@friend_circle)
    else
      flash[:error] ||= []
      flash[:error] << @friend_circle.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end
end
