class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :end_user_id, null: false
      t.integer :admin_user_id, null: false
      t.integer :inquiry_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end

    add_index :notifications, :end_user_id
    add_index :notifications, :admin_user_id
    add_index :notifications, :inquiry_id
  end
end
