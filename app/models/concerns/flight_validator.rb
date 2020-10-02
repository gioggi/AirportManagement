# frozen_string_literal: true

class FlightValidator < ActiveModel::Validator
  def validate(record)
    if record.departure_time && record.arrival_time && record.departure_airport && record.arrival_airport && record.airplane
      # #validate flight time
      if record.departure_time > record.arrival_time
        record.errors.add(:departure_time, "departure can't be before arrival")
      end

      if record.departure_airport == record.arrival_airport
        record.errors.add(:departure_airport, "arrival airport can't be the same of departure")
      end

      # #validate flight airports
      # to do refactor
      previous_flight = record.get_flight_before.first
      next_flight = record.get_flight_after.first
      if previous_flight
        if next_flight
          if record.arrival_time < next_flight.departure_time
            if record.arrival_airport != next_flight.departure_airport
              record.errors.add(:arrival_airport, "arrival airport can't be different of departure airport of next flight")
            end
          else
            record.errors.add(:arrival_time, "arrival time can't be after of departure time of next flight")
          end
          if record.departure_time > previous_flight.arrival_time
            if record.departure_airport != previous_flight.arrival_airport
              record.errors.add(:departure_airport, "departure airport can't be different of arrival airport of previous flight")
            end
          else
            record.errors.add(:departure_time, "departure time can't be before arrival time of previous flight")
          end
        end
      elsif next_flight
        if record.arrival_time < next_flight.departure_time
          if record.arrival_airport != next_flight.departure_airport
            record.errors.add(:arrival_airport, "arrival airport can't be different of departure airport of next flight")
          end
        else
          record.errors.add(:arrival_time, "arrival time can't be later of departure time of next flight")
        end
      end
    end
  end
end
