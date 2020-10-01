require 'rails_helper'

RSpec.describe Passenger, type: :model do
  context 'Healthy passenger' do
    it 'is valid with valid attributes' do
      expect(build(:passenger)).to be_valid
    end

    it 'is valid without a first_name' do
      expect(build(:passenger, first_name: nil)).to be_valid
    end

    it 'is valid without a last_name' do
      expect(build(:passenger, last_name: nil)).to be_valid
    end

    it 'is valid without a passport' do
      expect(build(:passenger, passport: nil)).to be_valid
    end

    it 'is not valid without a user' do
      expect(build(:passenger, user: nil)).to_not be_valid
    end
  end

  context 'Valid passport:' do
    it '9 number is valid' do
      expect(build(:passenger, passport: Faker::Number.number(digits: 9))).to be_valid
    end
    it '<9 number is invalid' do
      expect(build(:passenger, passport: Faker::Number.number(digits: rand(1..8)))).to_not be_valid
    end
    it '>9 number is invalid' do
      expect(build(:passenger, passport: Faker::Number.number(digits: rand(10..100)))).to_not be_valid
    end

    it 'alphanumeric is invalid' do
      expect(build(:passenger, passport: Faker::Lorem.characters(number: 9))).to_not be_valid
    end
  end

  context 'Valid on board:' do
    it "can't stay on board without first_name" do
      expect(build(:passenger, on_board: true, first_name: nil)).to_not be_valid
    end
    it "can't stay on board without last_name" do
      expect(build(:passenger, on_board: true, last_name: nil)).to_not be_valid
    end
    it "can't stay on board without passport" do
      expect(build(:passenger, on_board: true, passport: nil)).to_not be_valid
    end
    it "can't be nil" do
      expect(build(:passenger, on_board: nil)).to_not be_valid
    end
  end
end
