class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :room_id
      t.integer :user_id
      
      t.string :description
      t.date :start_date
      t.date :finish_date
      
      t.timestamps null: false
    end
  end
end
