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
    # TODO Change to current user ID
    kitchen.user_id = current_user.id

    json_result = {}

    if kitchen.save
      json_result[:success] = true
      json_result[:result] = kitchen.id
    else
      json_result[:success] = false
      json_result[:errors] = kitchen.errors.messages
    end

    render json: json_result
  end

  # PATCH /api/kitchens/:id
  def update
    kitchen = Kitchen.find_by(id: params[:id])

    kitchen.title = params[:title]
    kitchen.address = params[:address]
    kitchen.suburb = params[:suburb]
    kitchen.postcode = params[:postcode]
    kitchen.state = params[:state]
    kitchen.country = params[:country]
    kitchen.description = params[:description]
    kitchen.capacity = params[:capacity].to_i
    kitchen.fee = params[:fee].to_d
    # kitchen.latitude = -37.818026
    # kitchen.longitude = 144.959957

    json_result = {}

    if kitchen.save
      json_result[:success] = true
      json_result[:result] = kitchen.id
    else
      json_result[:success] = false
      json_result[:errors] = kitchen.errors.messages.to_json
    end

    render json: json_result
  end
end
