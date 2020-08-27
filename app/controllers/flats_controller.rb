class FlatsController < ApplicationController
  def index
    if params[:query]
      @flats = Flat.geocoded.where("address ILIKE '%#{params[:query]}%'")
    else
      @flats = Flat.geocoded
    end

    # @flats = Flat.geocoded # returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
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
