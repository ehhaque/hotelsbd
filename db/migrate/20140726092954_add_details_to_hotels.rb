class AddDetailsToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :email, :string
    add_column :hotels, :phone1, :integer
    add_column :hotels, :phone2, :integer
  end
end
