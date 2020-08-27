class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])  
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to booking_path(@review.booking)
  end
      
  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
