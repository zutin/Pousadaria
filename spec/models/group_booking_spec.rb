require 'rails_helper'

RSpec.describe GroupBooking, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:checkin_date) }
  it { should validate_presence_of(:checkout_date) }
  it { should validate_length_of(:name) }
  it { should belong_to(:inn) }
  it { should have_many(:group_booking_room) }
end
