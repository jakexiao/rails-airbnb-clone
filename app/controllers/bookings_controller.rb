class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
      if @booking.save
        redirect_to booking_path(@booking)
      else
        render "/flats/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path(@booking)
  end

  def dashboard
    @my_flats = current_user.flats
    @my_bookings = current_user.bookings
    @current_user = current_user
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests_number)
  end
end
