class Seat < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger, :optional => true
  validates_presence_of :price
  validates_presence_of :passenger, :unless => :booking_date.blank?
end
