class AddExaminationToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :examination, :date
  end
end
