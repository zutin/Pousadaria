class CreateGroupBookingRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :group_booking_rooms do |t|
      t.integer :guests
      t.references :group_booking, null: false, foreign_key: true
      t.references :inn_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
