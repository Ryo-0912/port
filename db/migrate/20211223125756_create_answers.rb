class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :solution
      t.text :process
      t.string :image

      t.timestamps
    end
  end
end
