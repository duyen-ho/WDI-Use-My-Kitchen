class BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find_by(id: params[:id])
  end
end
