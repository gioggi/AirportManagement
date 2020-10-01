class FlightValidator < ActiveModel::Validator
  def validate(record)

    ##validate flight time
    if record.departure_time > record.arrival_time
        record.errors.add(:departure_time, "departure can't be before arrival")
    end

    ##validate flight airports
    if record.get_flight_before.first
      if  record.get_flight_after.first
        if record.arrival_time < record.get_flight_after.departure_time
          if record.arrival_airport != record.get_flight_after.departure_airport
            record.errors.add(:arrival_airport, "arrival airport can't be different of departure airport of next flight")
          end
        else
          record.errors.add(:arrival_airport, "arrival time can't be major of departure time of next flight")
        end
        if record.departure_time > record.get_flight_after.arrival_time
          if record.departure_time != record.get_flight_after.arrival_airport
            record.errors.add(:arrival_airport, "departure airport can't be different of arrival airport of previous flight")
          end
        else
          record.errors.add(:arrival_airport, "arrival time can't be major of departure time of next flight")
        end
      end
    elsif  record.get_flight_after.first
      if record.arrival_time < record.get_flight_after.departure_time
        if record.arrival_airport != record.get_flight_after.departure_airport
          record.errors.add(:arrival_airport, "arrival airport can't be different of departure airport of next flight")
        end
      else
        record.errors.add(:arrival_airport, "arrival time can't be major of departure time of next flight")
      end
    end
  end
end