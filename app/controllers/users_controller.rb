class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :follow_list, :follower_list]

  def show
    @schedule = current_user.schedule
  end

  def search
    @users = User.search(params[:keyword])
  end

  def match
    @user = User.find(params[:id])
  end

  def follow
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end

  def follow_list
  end

  def follower_list
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
