class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:making_id])
    making = current_user.make(@user)
    making.save
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:making_id])
    making = current_user.release(@user)
    making.destroy
    redirect_to root_path
  end
end
