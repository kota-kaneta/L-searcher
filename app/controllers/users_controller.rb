class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :follow_list, :follower_list]
  before_action :set_root

  def show
    @user = User.find(params[:id])
    @schedule = @user.schedule
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      @currentUserEntry.each do |c|
        @userEntry.each do |u|
          if c.room_id == u.room_id
            @isRoom = true
            @roomId = c.room_id
          end
        end
      end

      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
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

  def time_line
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_root
    redirect_to root_path if request.referer.nil?
  end
end
