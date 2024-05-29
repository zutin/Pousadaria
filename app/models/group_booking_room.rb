class GroupBookingRoom < ApplicationRecord
  belongs_to :group_booking
  belongs_to :inn_room

  validates :guests, presence: true
  validates :guests, numericality: { greater_than: 0 }
end
