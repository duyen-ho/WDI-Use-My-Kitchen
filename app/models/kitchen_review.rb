class KitchenReview < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
end
