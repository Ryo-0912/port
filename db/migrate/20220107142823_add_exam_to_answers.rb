class AddExamToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :exam, :date
  end
end
