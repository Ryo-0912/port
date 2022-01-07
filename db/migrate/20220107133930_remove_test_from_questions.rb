class RemoveTestFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :test, :date
  end
end
