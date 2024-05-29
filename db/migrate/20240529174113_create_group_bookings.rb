class CreateGroupBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :group_bookings do |t|
      t.string :name
      t.date :checkin_date
      t.date :checkout_date
      t.references :inn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
