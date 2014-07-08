class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :user_id
      t.string :desc
      t.string :star_rating
      t.string :address
      t.string :city

      t.timestamps
    end
      add_index  :hotels, :name, unique: true
      add_index  :hotels, :city
      
  end
end
