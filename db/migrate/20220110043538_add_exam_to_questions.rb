class AddExamToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :exam, :date
  end
end
