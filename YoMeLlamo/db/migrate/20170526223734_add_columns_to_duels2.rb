class AddColumnsToDuels2 < ActiveRecord::Migration[5.1]
  def change
    add_column :duels, :votes1, :integer
    add_column :duels, :votes2, :integer
  end
end
