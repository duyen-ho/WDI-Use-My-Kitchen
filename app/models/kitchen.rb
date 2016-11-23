class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :kitchen_photos

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

  validates :address, presence: { message: "must be given please" }

  validates :postcode, length: { minimum: 4 }
  validates :postcode, presence: { message: "must be given please" }

  validates :country, presence: { message: "must be given please" }
  validates :country, format: { with: /\A[a-zA-Z]+\z/,
      message: "only allows letters" }

  validates :capacity, presence: { message: "must be given please" }

  validates :title, presence: { message: "must be given please" }
end
