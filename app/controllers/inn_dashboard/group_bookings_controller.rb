class InnDashboard::GroupBookingsController < ApplicationController
  before_action :authenticate_inn_owner!
  before_action :set_current_inn

  def new
    @group_booking = GroupBooking.new
  end

  private
  def set_current_inn
    @inn = current_inn_owner.inn
  end
end