class RemoveKanaFromGenres < ActiveRecord::Migration[6.0]
  def change
    remove_column :genres, :kana, :string
  end
end
