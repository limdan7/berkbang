class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :image
      t.integer :room_id

      t.timestamps
    end
  end
end
