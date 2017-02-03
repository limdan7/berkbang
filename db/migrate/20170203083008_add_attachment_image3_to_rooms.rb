class AddAttachmentImage3ToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :rooms, :image3
  end
end
