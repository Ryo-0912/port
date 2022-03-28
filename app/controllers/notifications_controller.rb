class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(15)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  def create
    @notification = Notification.find(params[:id])
    @notification.update
    redirect_to admin_users_path
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy!
    redirect_to notifications_path
  end
end
