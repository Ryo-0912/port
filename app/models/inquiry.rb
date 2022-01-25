class Inquiry < ApplicationRecord
  belongs_to :user
  has_one :notification, dependent: :destroy

  def create_notification_inquiry!(current_user)
    admin = User.find_by(admin: true)
    save_notification_inquiry!(current_user, admin.id)
  end

  def save_notification_inquiry!(current_user, admin_user_id)
    notification = current_user.active_notifications.new(
        admin_user_id: admin_user_id,
        inquiry_id: id,
        action: 'information'
      )
      notification.save if notification.valid?
  end
end
