class KitchenReview < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  belongs_to :booking
end
