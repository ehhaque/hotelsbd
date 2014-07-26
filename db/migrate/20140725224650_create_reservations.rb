class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :type
      t.datetime :start_date
      t.datetime :end_date
      t.references :room, index: true

      t.timestamps
    end
  end
end
