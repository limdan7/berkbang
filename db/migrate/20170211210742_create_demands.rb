class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.integer :user_id
      t.text :gender
      t.date :start_date
      t.date :finish_date
      t.text :room_private
      t.integer :price
      t.text :description

      t.timestamps null: false
    end
  end
end
