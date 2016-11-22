class Api::BookingsController < ApplicationController
  # POST /api/bookings
  # Create new booking
  def create
    # TODO: Consume message text
    booking = Booking.new
    listing = Kitchen.find_by(id: params[:kitchen_id])

    booking.booking_date = Time.new(params[:booking_date])
    booking.note = params[:note]
    # TODO: Set different default state
    booking.status = 'CONFIRMED'
    # TODO: Calculate full booking fee
    booking.fee = listing.fee
    booking.kitchen_id = params[:kitchen_id]
    booking.user_id = session[:user_id]

    json_result = {}

    if booking.save
      json_result[:success] = true
      json_result[:result] = booking.to_json
    else
      json_result[:success] = false
      json_result[:erros] = booking.errors.messages.to_json
    end

    render json: json_result
  end
end
