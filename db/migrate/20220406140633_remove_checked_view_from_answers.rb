class RemoveCheckedViewFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :checked_view, :boolean
  end
end
