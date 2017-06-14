class AddColumnsToDuels < ActiveRecord::Migration[5.1]
  def change
    add_column :duels, :song1_id, :integer
    add_column :duels, :song2_id, :integer
  end
end
