class AddAttachmentAvatarToSingers < ActiveRecord::Migration[5.1]
  def up
    change_table :singers do |t|
      t.attachment :avatar
    end
  end

  def down
    remove_attachment :singers, :avatar
  end
end
