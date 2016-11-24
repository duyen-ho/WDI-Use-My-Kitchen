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

    if !kitchen.available?(booking.booking_date)
      json_result[:success] = false
      json_result[:errors] = ['Kitchen is not available on this date']
    elsif !booking.save
      json_result[:success] = false
      json_result[:errors] = booking.errors.full_messages
    else
      json_result[:success] = true
      json_result[:booking] = booking
    end

    render json: json_result
  end

  # PATCH /api/bookings/:id
  # Cancel selected booking
  def cancel
    booking = Booking.find_by(id: params[:id])
    booking.status = 'CANCELLED'

    json_result = {}

    if booking.save
      json_result[:success] = true
    else
      json_result[:success] = false
    end

    render json: json_result
  end
end
