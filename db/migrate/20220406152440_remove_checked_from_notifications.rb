class RemoveCheckedFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :checked, :boolean
  end
end
