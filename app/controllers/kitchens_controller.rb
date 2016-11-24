class KitchensController < ApplicationController
  layout "search_results", only: [:index]

  def index
  end

  def new
  end

  def show
    @kitchen = Kitchen.find_by(id: params[:id])

    if @kitchen
      render :show
    else
      @error = 'Kitchen not found'
      render :error
    end
  end

  def edit
    @kitchen = Kitchen.find_by(id: params[:id])
    # TODO: Populate multiple photos
    @kitchen_photo = KitchenPhoto.find_by(kitchen_id: params[:id])
  end



end
