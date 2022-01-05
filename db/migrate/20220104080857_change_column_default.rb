class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :questions, :poor, from: true, to: false
  end
end
