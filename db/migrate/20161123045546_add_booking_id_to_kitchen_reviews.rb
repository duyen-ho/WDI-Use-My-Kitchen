class AddBookingIdToKitchenReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :kitchen_reviews, :booking, foreign_key: true
  end
end
