class Seat < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger, optional: true
  validates :passenger, presence: { if: :booking_date_present? }
  validates :price, :number, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 }
  validates :number, numericality: { greater_than: 0 }

  private

  def booking_date_present?
    booking_date.present?
  end
end
