class Api::KitchensController < ApplicationController
  # GET /api/kitchens
  def index
    # kitchens = Kitchen.all
    # on load parse query string
    kitchens = Kitchen.where('suburb = ? AND capacity >= ?', URI.decode_www_form_component(params[:location]), params[:guests].to_i)

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
    kitchen.user_id = current_user.id

    json_result = {}

    if kitchen.save

      kitchen_photo = KitchenPhoto.new
      kitchen_photo.kitchen_id = kitchen.id
      kitchen_photo.image_url = params[:image_url]
      kitchen_photo.save
      # TODO validation

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

      kitchen_photo = KitchenPhoto.find_by(kitchen_id: params[:id])
      kitchen_photo.image_url = params[:image_url]
      kitchen_photo.save
      # TODO validation

      json_result[:success] = true
      json_result[:result] = kitchen.id
    else
      json_result[:success] = false
      json_result[:errors] = kitchen.errors.messages.to_json
    end

    render json: json_result
  end
end
