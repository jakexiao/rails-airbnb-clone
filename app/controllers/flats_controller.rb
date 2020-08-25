class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
      if @flat.save 
        current_user.role = "owner"
        current_user.save
        redirect_to flat_path(@flat)
      else
        render :new
    end
  end

  def dashboard
    @my_flats = current_user.flats
    @current_user = current_user
  end 

  private

    def flat_params
      params.require(:flat).permit(:address, :price, :name, :photo, :description)
    end
end
