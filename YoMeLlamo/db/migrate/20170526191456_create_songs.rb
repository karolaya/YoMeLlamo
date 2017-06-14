class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :link
      t.integer :singer_id

      t.timestamps
    end
  end
end
