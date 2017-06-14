class CreateDuels < ActiveRecord::Migration[5.1]
  def change
    create_table :duels do |t|
      t.integer :singer1_id
      t.integer :singer2_id

      t.timestamps
    end
  end
end
