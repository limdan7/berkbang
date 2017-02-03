class AddAttachmentImage2ToRooms < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :rooms, :image2
  end
end
