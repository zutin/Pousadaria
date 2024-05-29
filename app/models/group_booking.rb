class GroupBooking < ApplicationRecord
  belongs_to :inn

  validates :name, :checkin_date, :checkout_date, presence: true
  validates :name, length: { in: 3..50 }
  validate :checkin_date_cannot_be_in_the_past, :checkout_date_cannot_be_in_the_past, :checkin_date_cannot_be_after_checkout_date, :checkout_date_cannot_be_before_checkin_date

  def checkin_date_cannot_be_in_the_past
    if checkin_date.present? && checkin_date < Date.today
      errors.add(:checkin_date, "não pode ser no passado")
    end
  end

  def checkout_date_cannot_be_in_the_past
    if checkout_date.present? && checkout_date < Date.today
      errors.add(:checkout_date, "não pode ser no passado")
    end
  end

  def checkout_date_cannot_be_before_checkin_date
    if checkout_date.present? && checkin_date.present?  && checkout_date < checkin_date
      errors.add(:checkout_date, "não pode ser antes do check-in")
    end
  end

  def checkin_date_cannot_be_after_checkout_date
    if checkin_date.present? && checkout_date.present?  && checkin_date > checkou_date
      errors.add(:checkin_date, "não pode ser depois do check-out")
    end
  end
end
