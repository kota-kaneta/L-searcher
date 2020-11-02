class NotificationsController < ApplicationController
  before_action :set_root, only: [:index]

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  private

  def set_root
    redirect_to root_path if request.referer.nil?
  end
end