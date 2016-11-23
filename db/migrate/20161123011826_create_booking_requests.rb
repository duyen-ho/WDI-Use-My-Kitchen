class CreateBookingRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_requests do |t|
      t.timestamp :booking_date
      t.string :status
      t.references :user, foreign_key: true
      t.references :kitchen, foreign_key: true

      t.timestamps
    end
  end
end
