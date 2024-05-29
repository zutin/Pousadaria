class GroupBookingRoom < ApplicationRecord
  belongs_to :group_booking
  belongs_to :inn_room

end
