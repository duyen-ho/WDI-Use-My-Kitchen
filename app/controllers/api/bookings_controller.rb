class Api::BookingsController < ApplicationController
  # GET /api/bookings
  # Return current user's booking history
  def index
    bookings = Booking
      .where(user_id: session[:user_id])
      .order('booking_date DESC')
    # TODO: Filter only upcoming bookings for current user
    render json: bookings
  end

  # POST /api/bookings
  # Create new booking
  def create
    # TODO: Consume message text
    booking = Booking.new
    kitchen = Kitchen.find_by(id: params[:kitchen_id])

    booking.booking_date = Date.parse(params[:booking_date])
    booking.note = params[:note]
    # TODO: Set different default state
    booking.status = 'CONFIRMED'
    # TODO: Calculate full booking fee
    booking.fee = kitchen.fee
    booking.kitchen_id = params[:kitchen_id]
    booking.user_id = session[:user_id]

    json_result = {}

    if kitchen.available?(booking.booking_date) && booking.save
      json_result[:success] = true
      json_result[:result] = booking.to_json
    else
      json_result[:success] = false
      json_result[:erros] = booking.errors.messages.to_json
    end

    render json: json_result
  end
end
