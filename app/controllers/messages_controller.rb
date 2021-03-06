class MessagesController < ApplicationController
  before_action :set_root, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      @room = @message.room
      if @message.save
        @roommembernotme = Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
        @theid = @roommembernotme.find_by(room_id: @room.id)
        notification = current_user.active_notifications.new(
          room_id: @room.id,
          message_id: @message.id,
          visited_id: @theid.user_id,
          visitor_id: current_user.id,
          action: 'direct'
        )
        notification.checked = true if notification.visitor_id == notification.visited_id
        notification.save if notification.valid?

        redirect_to "/rooms/#{@message.room_id}"
      else
        redirect_to "/rooms/#{@message.room_id}"
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end

  def set_root
    redirect_to root_path if request.referer.nil?
  end
end
