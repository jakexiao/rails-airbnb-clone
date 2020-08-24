class FlatsController < ApplicationController
  def index
    @flat = Flats.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
      if @flat.save redirect_to flat_path(@flat)
      else
        render :new
    end
  end
end

private

  def restaurant_params
    params.require(:flat).permit(:address, :price, :name, :photo, :description)
  end
end
