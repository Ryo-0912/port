class RemoveImageFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :image, :string
  end
end
