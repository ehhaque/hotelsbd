class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :reservations, :type, :reserve_type
  end
end
