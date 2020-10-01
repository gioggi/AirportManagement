require 'rails_helper'

RSpec.describe Flight, type: :model do
  context 'Healthy flight' do
    it "is valid with valid attributes" do
      expect(build(:flight)).to be_valid
    end

    it "is not valid without a number" do
      expect(build(:flight, number: nil)).to_not be_valid
    end

    it "is not valid with same a number" do
      flight_number = Faker::Lorem.characters(number: 10)
      first_airplane = create(:flight, number: flight_number)
      expect(build(:flight, number: flight_number)).to_not be_valid
    end

    it "is not valid without a departure_time" do
      expect(build(:flight, departure_time: nil)).to_not be_valid
    end

    it "is not valid without a arrival_time" do
      expect(build(:flight, arrival_time: nil)).to_not be_valid
    end

    it "is not valid without a departure_airport" do
      expect(build(:flight, departure_airport: nil)).to_not be_valid
    end

    it "is not valid without a arrival_airport" do
      expect(build(:flight, arrival_airport: nil)).to_not be_valid
    end

    it "is not valid without a airplane" do
      expect(build(:flight, airplane: nil)).to_not be_valid
    end
  end

  # context 'Valid currency:' do
  #   it "EUR is valid" do
  #     expect(build(:user, currency: 'EUR')).to be_valid
  #   end
  #   it "USD is valid" do
  #     expect(build(:user, currency: 'USD')).to be_valid
  #   end
  #   it "other is invalid" do
  #     expect(build(:user, currency: 'JPY')).to_not be_valid
  #   end
  # end
  #
  # context 'Valid language:' do
  #   it "it is valid" do
  #     expect(build(:user, language: 'it')).to be_valid
  #   end
  #   it "en is valid" do
  #     expect(build(:user, language: 'en')).to be_valid
  #   end
  #   it "other is invalid" do
  #     expect(build(:user, language: 'de')).to_not be_valid
  #   end
  # end
  #
  # context 'Valid time_zone:' do
  #   it "only a tzinfo zone is valid" do
  #     expect(build(:user, time_zone: 'UTC')).to be_valid
  #   end
  #   it "other is invalid" do
  #     expect(build(:user, time_zone: 'US/Centrl')).to_not be_valid
  #   end
  # end
end
