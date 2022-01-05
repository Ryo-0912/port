class RemovePoorFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :poor, :boolean
  end
end
