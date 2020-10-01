require 'rails_helper'

RSpec.describe Seat, type: :model do
  context 'Healthy seat' do
    it "is valid with valid attributes" do
      expect(build(:seat)).to be_valid
    end

    it "is valid without a passenger" do
      expect(build(:seat, booking_date: nil)).to be_valid
    end

    it "is invalid without a price" do
      expect(build(:seat, price: nil)).to_not be_valid
    end

    it "is valid without a flight" do
      expect(build(:seat, flight: nil)).to_not be_valid
    end

    it "is not valid without a number" do
      expect(build(:seat, number: nil)).to_not be_valid
    end

  end

end
