class ChangeTypeFood < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :float, default: 0
  end
end
