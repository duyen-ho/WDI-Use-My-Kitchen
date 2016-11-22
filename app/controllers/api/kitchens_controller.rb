class Api::KitchensController < ApplicationController
  def index
    kitchens = Kitchen.all
    render json: kitchens
  end
end
