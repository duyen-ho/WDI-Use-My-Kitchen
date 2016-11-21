class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.timestamp :booking_date
      t.text :note
      t.string :status
      t.decimal :fee
      t.references :user, foreign_key: true
      t.references :kitchen, foreign_key: true

      t.timestamps
    end
  end
end
