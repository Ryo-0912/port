class RemoveExamFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :exam, :date
  end
end
