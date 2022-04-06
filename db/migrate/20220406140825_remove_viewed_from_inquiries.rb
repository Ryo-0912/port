class RemoveViewedFromInquiries < ActiveRecord::Migration[6.0]
  def change
    remove_column :inquiries, :viewed, :boolean
  end
end
