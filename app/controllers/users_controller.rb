class UsersController < ApplicationController

  def show
    @schedule = current_user.schedule
  end

  def search
      @users = User.search(params[:keyword])
  end
end
# ここからかくにん
# current_userはどう？