class Kitchen < ApplicationRecord
  belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode


  def full_street_address
    [address, suburb, postcode,state, country].compact.join(', ')
  end




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
