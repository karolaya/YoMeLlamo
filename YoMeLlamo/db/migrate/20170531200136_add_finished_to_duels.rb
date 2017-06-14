class AddFinishedToDuels < ActiveRecord::Migration[5.1]
  def change
    add_column :duels, :finished, :boolean
  end
end
