class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_type
      t.integer :hotel_id
      t.string :bed_type
      t.integer :num_beds
      t.decimal :price
      t.string :currency

      t.timestamps
    end
    add_index  :rooms, :price
  end
  
end
