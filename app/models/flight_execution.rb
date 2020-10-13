class FlightExecution < ApplicationRecord
  belongs_to :flight
  has_one :airplane, through: :flight
  include AASM

  aasm do
    state :departed, initial: true
    state :in_air
    state :landed

    event :start, before_update: :airplane_in_air do
      transitions from: :departed, to: :in_air
    end

    event :arrive, before_update: :airplane_to_ground do
      transitions from: :departed, to: :in_air
    end
  end

  def airplane_in_air
    airplane.start!
    flight.start!
  end

  def airplane_to_ground
    arrival_time = DateTime.now
    save
    airplane.to_ground!
    flight.landing!
  end
end
