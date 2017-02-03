class AddRoomTokenToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :room_token, :string
  end
end
