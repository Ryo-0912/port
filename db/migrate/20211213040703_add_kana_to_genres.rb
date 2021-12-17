class AddKanaToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :kana, :string
  end
end
