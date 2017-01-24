class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :address
      t.text :description
      
    end
  end
end
