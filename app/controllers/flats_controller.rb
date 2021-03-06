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
    # @bookings = @flat.bookings
    @reviews = []
    @flat.bookings.each do |booking|
      booking.reviews.each do |review|
        @reviews << review
      end
    end
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

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  private

    def flat_params
      params.require(:flat).permit(:address, :price, :name, :photo, :description, photos: [])
    end
end
