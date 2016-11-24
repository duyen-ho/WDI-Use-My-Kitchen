class Api::KitchenReviewsController < ApplicationController

  # GET /api/reviews
  def index
    result = {}
    review = KitchenReview.all
    render json: review
  end

  # POST /api/reviews
  # Create new reviews
  def create
    kitchen_review = KitchenReview.new
    kitchen_review.content = params[:content]
    kitchen_review.score = params[:score]
    kitchen_review.user_id = session[:user_id]
    booking = Booking.find_by(id: params[:booking_id])
    kitchen_review.booking_id = booking.id
    kitchen_review.kitchen_id = booking.kitchen_id

    json_result = {}
    json_result[:kitchen_review] = kitchen_review
    kitchen_review.save
    render json: json_result
  end


end
