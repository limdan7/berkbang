class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.text :gender
      t.date :start_date
      t.date :finish_date
      t.text :room_private
      t.integer :price

      t.timestamps null: false
    end
  end
end
