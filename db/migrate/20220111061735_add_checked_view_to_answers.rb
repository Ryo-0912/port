class AddCheckedViewToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :checked_view, :boolean, default: false, null: false
  end
end
