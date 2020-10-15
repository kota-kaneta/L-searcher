class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def new
    
  end
  
  def create
    
  end
end