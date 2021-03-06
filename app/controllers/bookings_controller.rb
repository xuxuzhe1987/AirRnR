class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def mybookings
    @bookings = Booking.where(user_id: current_user.id)
    authorize @bookings
  end

  def new
    @book = Book.find(params[:book_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @book = Book.find(params[:book_id])
    @booking.user_id = current_user.id
    @booking.book_id = @book.id
    authorize @booking
    if @booking.save
      @book.availability = false
      @book.save
      redirect_to booking_path(@booking)
    else
      render :new
    end

  end

  def show
    authorize @booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
