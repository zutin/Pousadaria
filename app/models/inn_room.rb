class InnRoom < ApplicationRecord
  belongs_to :inn
  has_many :group_booking_room
  has_one_attached :photo

  validates :name, presence: true
  validates :size, :guest_limit, numericality: { greater_than: 0 }
end
