class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient: current_user.id)
    @contacts = User.all
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      ActionCable.server.broadcast("notifications", { message: @notification.message })
      redirect_to message_path(@notification.recipient)
    end
  end

  def message
    @recipient =  User.find(params[:id])
    @contacts = User.all
    @notifications = Notification.where(recipient: current_user.id, user_id: @recipient.id)
    @current_messages = Notification.where(user_id: current_user.id, recipient: @recipient.id)
    @notification = Notification.new
  end

  private

  def notification_params
    params.require(:notification).permit(:message, :title, :user_id, :recipient)
  end
end
