# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seat, type: :model do
  context 'Healthy seat' do
    it 'is valid with valid attributes' do
      expect(build(:seat)).to be_valid
    end

    it 'is valid without a passenger' do
      expect(build(:seat, booking_date: nil)).to be_valid
    end

    it 'is invalid without a price' do
      expect(build(:seat, price: nil)).to_not be_valid
    end

    it 'is valid without a flight' do
      expect(build(:seat, flight: nil)).to_not be_valid
    end

    it 'is not valid without a number' do
      expect(build(:seat, number: nil)).to_not be_valid
    end
  end

  context 'Valida price' do
    it 'is invalid less than 0.01' do
      expect(build(:seat, price: 0)).to_not be_valid
    end
    it '0.01 is invalid' do
      expect(build(:seat, price: 0.01)).to be_valid
    end
    it 'is invalid greater than 10000' do
      expect(build(:seat, price: 10_001)).to_not be_valid
    end
    it '10000 is valid greater' do
      expect(build(:seat, price: 10_000)).to be_valid
    end
    it 'is invalid with more two decimal' do
      expect(build(:seat, price: 0.001)).to_not be_valid
    end
    it 'is not valid without a string' do
      expect(build(:seat, number: 'awd')).to_not be_valid
    end
  end
end
