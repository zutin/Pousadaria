require 'rails_helper'

RSpec.describe GroupBookingRoom, type: :model do
  it { should belong_to(:group_booking) }
  it { should belong_to(:inn_room) }
end
