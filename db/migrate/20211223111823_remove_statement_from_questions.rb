class RemoveStatementFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :statement, :text
  end
end
