class Api::KitchensController < ApplicationController
  # GET /api/kitchens
  def index
    kitchens = Kitchen.all
    render json: kitchens
  end

  # POST /api/kitchens
  def create
    kitchen = Kitchen.new
    kitchen.title = params[:title]
    kitchen.address = params[:address]
    kitchen.suburb = params[:suburb]
    kitchen.postcode = params[:postcode]
    kitchen.state = params[:state]
    kitchen.country = params[:country]
    kitchen.description = params[:description]
    kitchen.capacity = params[:capacity].to_i
    kitchen.fee = params[:fee].to_d
    # TODO: Change to actual lat/long
    kitchen.latitude = -37.818026
    kitchen.longitude = 144.959957
    # TODO Change to current user ID
    kitchen.user_id = 1

    response = {}

    if kitchen.save
      response[:success] = true
      response[:result] = kitchen.id
    else
      response[:success] = false
      response[:errors] = kitchen.errors.messages.to_json
    end

    render json: response
  end
end
