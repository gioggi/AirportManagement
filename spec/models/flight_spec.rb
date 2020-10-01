require 'rails_helper'

RSpec.describe Flight, type: :model do
  context 'Healthy flight' do
    it 'is valid with valid attributes' do
      expect(build(:flight)).to be_valid
    end

    it 'is invalid with more seats of airplane' do
      flight = create(:flight)
      flight.seats << build(:seat)
      expect(flight).to_not be_valid
    end

    it 'is not valid without a number' do
      expect(build(:flight, number: nil)).to_not be_valid
    end

    it 'is not valid with same a number' do
      flight_number = Faker::Lorem.characters(number: 10)
      create(:flight, number: flight_number)
      expect(build(:flight, number: flight_number)).to_not be_valid
    end

    it 'is not valid without a departure_time' do
      expect(build(:flight, departure_time: nil)).to_not be_valid
    end

    it 'is not valid without a arrival_time' do
      expect(build(:flight, arrival_time: nil)).to_not be_valid
    end

    it 'is not valid without a departure_airport' do
      expect(build(:flight, departure_airport: nil)).to_not be_valid
    end

    it 'is not valid without a arrival_airport' do
      expect(build(:flight, arrival_airport: nil)).to_not be_valid
    end

    it 'is not valid without a airplane' do
      expect(build(:flight, airplane: nil)).to_not be_valid
    end
  end

  context 'Valid airport:' do
    it "arrival airport can't be the same of departure" do
      airport = create(:airport)
      expect(build(:flight, departure_airport: airport, arrival_airport: airport)).to_not be_valid
    end
  end

  context 'Valid time:' do
    it "departure can't be before arrival" do
      departure_time = DateTime.now
      arrival_time = DateTime.now - 1.minute
      expect(build(:flight, departure_time: departure_time, arrival_time: arrival_time)).to_not be_valid
    end
    it "can't create a flight between another flight with same airplane" do
      airplane = create(:airplane)
      first_departure_time = DateTime.now
      first_arrival_time = DateTime.now + 10.minutes
      second_departure_time = DateTime.now + 1.minute
      second_arrival_time = first_arrival_time - 1.minute
      create(:flight, airplane: airplane, departure_time: first_departure_time, arrival_time: first_arrival_time)
      second_flight = build(:flight, airplane: airplane, departure_time: second_departure_time, arrival_time: second_arrival_time)
      expect(second_flight).to_not be_valid
    end
    it "can't create a flight with departure between another flight with same airplane" do
      airplane = create(:airplane)
      first_departure_time = DateTime.now + 10.minutes
      first_arrival_time = DateTime.now + 20.minutes
      second_departure_time = DateTime.now + 15.minutes
      second_arrival_time = first_arrival_time - 25.minutes
      create(:flight, airplane: airplane, departure_time: first_departure_time, arrival_time: first_arrival_time)
      second_flight = build(:flight, airplane: airplane, departure_time: second_departure_time, arrival_time: second_arrival_time)
      expect(second_flight).to_not be_valid
    end
    it "can't create a flight with arrival between another flight with same airplane" do
      airplane = create(:airplane)
      first_departure_time = DateTime.now + 10.minutes
      first_arrival_time = DateTime.now + 20.minutes
      second_departure_time = DateTime.now
      second_arrival_time = first_arrival_time + 15.minutes
      create(:flight, airplane: airplane, departure_time: first_departure_time, arrival_time: first_arrival_time)
      second_flight = build(:flight, airplane: airplane, departure_time: second_departure_time, arrival_time: second_arrival_time)
      expect(second_flight).to_not be_valid
    end
    it "can't create a flight between another flight with different airplane" do
      first_departure_time = DateTime.now
      first_arrival_time = DateTime.now + 10.minutes
      second_departure_time = DateTime.now + 1.minute
      second_arrival_time = first_arrival_time - 1.minute
      create(:flight, departure_time: first_departure_time, arrival_time: first_arrival_time)
      second_flight = build(:flight, departure_time: second_departure_time, arrival_time: second_arrival_time)
      expect(second_flight).to be_valid
    end
    it 'can create a flight with departure between another flight with different airplane' do
      first_departure_time = DateTime.now + 10.minutes
      first_arrival_time = DateTime.now + 20.minutes
      second_departure_time = DateTime.now + 15.minutes
      second_arrival_time = first_arrival_time + 25.minutes
      create(:flight, departure_time: first_departure_time, arrival_time: first_arrival_time)
      second_flight = build(:flight, departure_time: second_departure_time, arrival_time: second_arrival_time)
      expect(second_flight).to be_valid
    end
    it "can't create a flight with arrival between another flight with different airplane" do
      first_departure_time = DateTime.now + 10.minutes
      first_arrival_time = DateTime.now + 20.minutes
      second_departure_time = DateTime.now
      second_arrival_time = first_arrival_time + 15.minutes
      create(:flight, departure_time: first_departure_time, arrival_time: first_arrival_time)
      second_flight = build(:flight, departure_time: second_departure_time, arrival_time: second_arrival_time)
      expect(second_flight).to be_valid
    end
  end

  # context 'Valid time_zone:' do
  #   it "only a tzinfo zone is valid" do
  #     expect(build(:user, time_zone: 'UTC')).to be_valid
  #   end
  #   it "other is invalid" do
  #     expect(build(:user, time_zone: 'US/Centrl')).to_not be_valid
  #   end
  # end
end
