class RemoveExaminationFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :Examination, :date
  end
end
