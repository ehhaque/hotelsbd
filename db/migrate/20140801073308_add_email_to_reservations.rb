class AddEmailToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :guest_email, :string
  end
end
