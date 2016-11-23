class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :bookings

  def available?(date)
    bookings.each do |booking|
      if booking.booking_date.to_date == date.to_date
        return false
      end
    end
    return true
  end
end
