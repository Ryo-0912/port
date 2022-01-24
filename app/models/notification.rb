class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :inquiry
  belongs_to :end_user, class_name: 'User', foreign_key: 'end_user_id', optional: true
  belongs_to :admin_user, class_name: 'User', foreign_key: 'admin_user_id', optional: true
end
