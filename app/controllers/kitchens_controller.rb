class KitchensController < ApplicationController
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
end
