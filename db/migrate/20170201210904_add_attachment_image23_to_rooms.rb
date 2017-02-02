class AddAttachmentImage23ToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :image2
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :rooms, :image2
    remove_attachment :rooms, :image3
  end
end
