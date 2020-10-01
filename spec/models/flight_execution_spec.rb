require 'rails_helper'

RSpec.describe FlightExecution, type: :model do
  context 'Healthy flight execution' do
    it 'is valid with valid attributes' do
      expect(build(:flight_execution)).to be_valid
    end

    it 'is not valid without a flight' do
      expect(build(:flight_execution, flight: nil)).to_not be_valid
    end
  end
end
