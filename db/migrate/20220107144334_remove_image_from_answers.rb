class RemoveImageFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :image, :string
  end
end
