class InnDashboard::GroupBookingsController < ApplicationController
  before_action :authenticate_inn_owner!
  before_action :set_current_inn

  def new
    @group_booking = GroupBooking.new
  end

  def create
    booking_params = params.require(:group_booking).permit(:name, :checkin_date, :checkout_date)
    @group_booking = GroupBooking.new(booking_params)
    @group_booking.inn = @inn

    if @group_booking.save
      return redirect_to inn_management_path, notice: 'Você registrou a reserva de grupo com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_current_inn
    @inn = current_inn_owner.inn
  end
end