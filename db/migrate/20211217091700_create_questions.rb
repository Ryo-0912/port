class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :statement
      t.string :image
      t.boolean :poor
      t.date :test
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
