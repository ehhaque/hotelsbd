class DropReserveTable < ActiveRecord::Migration
  def change
  	 drop_table :reservations if self.table_exists?("reservations")
  end
end
