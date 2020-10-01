class Flight < ApplicationRecord
  belongs_to :airplane
  belongs_to :departure_airport, :class_name => "Airport"
  belongs_to :arrival_airport, :class_name => "Airport"
  validates_presence_of :number, :arrival_time, :departure_time
  validates_uniqueness_of :number
  validates_with  FlightValidator

  def get_flight_before
    Flight.where("airplane_id = ? and departure_time <= ?",airplane.id,arrival_time).order(:arrival_time).limit(1)
  end

  def get_flight_after
    Flight.where("airplane_id = ? and departure_time <= ?",airplane.id,arrival_time).order(departure_time: :asc).limit(1)
  end
end
