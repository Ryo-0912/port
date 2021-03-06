class User < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :questions, through: :genres
  has_many :inquiries, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'end_user_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'admin_user_id', dependent: :destroy

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :reset_password_token, uniqueness: true, allow_nil: true
end
