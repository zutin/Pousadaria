class InnDashboard::GroupBookingRoomsController < ApplicationController
  before_action :authenticate_inn_owner!
  before_action :set_current_inn
  before_action :set_current_group_booking

  def new
    @group_booking_room = GroupBookingRoom.new
    @inn_rooms = @inn.inn_rooms
  end

  def create
    room_params = params.require(:group_booking_room).permit(:guests, :inn_room_id)
    
    @group_booking_room = GroupBooking.new(room_params)
    if @group_booking_room.save
      redirect_to @group_booking_room, notice: ''
    else
    end
  end

  private
  def set_current_inn
    @inn = current_inn_owner.inn
  end

  def set_current_group_booking
    @group_booking = GroupBooking.find(params[:group_booking_id])
  end
end