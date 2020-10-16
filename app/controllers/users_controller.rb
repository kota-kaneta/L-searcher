class UsersController < ApplicationController
  def show
    @schedule = current_user.schedule
  end
end