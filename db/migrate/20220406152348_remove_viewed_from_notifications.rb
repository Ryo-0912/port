class RemoveViewedFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :viewed, :boolean
  end
end
