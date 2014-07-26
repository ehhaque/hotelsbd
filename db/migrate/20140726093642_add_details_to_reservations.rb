class AddDetailsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :request, :string
    add_column :reservations, :firstname, :string
    add_column :reservations, :lastname, :string
    add_column :reservations, :phone, :integer
  end
end
