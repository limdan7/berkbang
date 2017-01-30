class AddMoreInfoToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :price, :integer
    add_column :rooms, :start_date, :date
    add_column :rooms, :finish_date, :date
    add_column :rooms, :room_private, :text
    add_column :rooms, :room_type, :text
    add_column :rooms, :utility, :integer
    add_column :rooms, :parking, :boolean
    add_column :rooms, :parking_fee, :integer
    add_column :rooms, :deposit, :integer
    add_column :rooms, :gender, :text
    add_column :rooms, :furnished, :boolean
    add_column :rooms, :furnished_details, :text
    add_column :rooms, :bath, :integer
  end
end
