class AddViewedToInquiries < ActiveRecord::Migration[6.0]
  def change
    add_column :inquiries, :viewed, :boolean, default: false, null: false
  end
end
