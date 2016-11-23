class Kitchen < ApplicationRecord
  belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode


  def full_street_address
    [address, suburb, postcode,state, country].compact.join(', ')
  end



end
