class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.string :image
      t.integer :room_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
