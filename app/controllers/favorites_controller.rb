class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:making_id])
    making = current_user.make(@user)
    making.save
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:making_id])
    making = current_user.release(@user)
    making.destroy
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    end
end
