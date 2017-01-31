class ChangeAddressFormatInMyTable < ActiveRecord::Migration
  def up
    change_column :rooms, :address, :text
  end
  
  def down
    change_column :rooms, :address, :string
  end
end
