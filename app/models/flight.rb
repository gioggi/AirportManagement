class Flight < ApplicationRecord

  belongs_to :airplane
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_one :flight_execution
  has_many :seats

  validates :number, :arrival_time, :departure_time, presence: true
  validates :number, uniqueness: true
  validates_with FlightValidator
  validate :seats_numbers_valid?

  before_validation :create_seats

  include AASM

  aasm do
    state :scheduled, initial: true
    state :gate
    state :departed
    state :in_air
    state :landed
    state :arrived
    state :cancelled

    event :boarding do
      transitions from: :scheduled, to: :gate, guard: :airplane_to_ground?
    end
    event :depart, after_commit: :start_flight_execution do
      transitions from: :gate, to: :departed, guard: :airplane_to_ground?
    end

    event :start do
      transitions from: :departed, to: :in_air, guard: :airplane_in_air?
    end

    event :landing do
      transitions from: :in_air, to: :landed, guard: :airplane_to_ground?
    end

    event :finish_flight do
      transitions from: :landed, to: :arrived, guard: :airplane_to_ground?
    end

    event :cancel do
      transitions from: :scheduled, to: :cancelled
    end
  end

  def start_flight_execution
    FlightExecution.create(departure_time: DateTime.now, flight: self)
  end

  def airplane_to_ground?
    airplane.ground?
  end

  def airplane_in_air?
    airplane.in_air?
  end
  def get_flight_before
    Flight.where('airplane_id = ? and departure_time <= ?', airplane.id, arrival_time).order(:arrival_time).limit(1)
  end

  def get_flight_after
    Flight.where('airplane_id = ? and departure_time <= ?', airplane.id, arrival_time).order(departure_time: :asc).limit(1)
  end

  def self.to_option
    Flight.all.map{|f| [f.number, f.id]}
  end

  def self.active_flights
    Flight.all.where('departure_time > ? ',DateTime.now)
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