class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
    @notification = Notification.new
    @contacts = User.all
  end

  def show
    @messages = User.find(params[:id]).notifications.map(&:message)
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      ActionCable.server.broadcast("notifications", { message: @notification.message })
      flash[:notice] = "Message Sent!"
      redirect_to root_url
    else
      flash[:alert] = "Error Sending message! Plz try again"
      redirect_to root_url
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:message, :title, :user_id)
  end
end
