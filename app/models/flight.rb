class Flight < ApplicationRecord
  belongs_to :airplane
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :seats

  validates :number, :arrival_time, :departure_time, presence: true
  validates :number, uniqueness: true
  validates_with FlightValidator
  validate :seats_numbers_valid?

  before_validation :create_seats

  def get_flight_before
    Flight.where('airplane_id = ? and departure_time <= ?', airplane.id, arrival_time).order(:arrival_time).limit(1)
  end

  def get_flight_after
    Flight.where('airplane_id = ? and departure_time <= ?', airplane.id, arrival_time).order(departure_time: :asc).limit(1)
  end

  def self.to_option
    Flight.all.map{|f| [f.number, f.id]}
  end


  private

  def seats_numbers_valid?
    if airplane.present?
      errors.add(:seats, 'too much seats for this airplane') if seats.size > airplane.seats_numbers
    end
  end

  # create seats
  def create_seats
    if airplane.present?
      airplane.seats_numbers.times do |i|
        seats.build(number: i + 1, price: 20)
      end
    end
  end
end