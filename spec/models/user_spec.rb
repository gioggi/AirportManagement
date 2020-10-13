# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Healthy user' do
    it 'is valid with valid attributes' do
      expect(build(:user)).to be_valid
    end

    it 'is not valid without a first_name' do
      expect(build(:user, first_name: nil)).to_not be_valid
    end

    it 'is not valid without a last_name' do
      expect(build(:user, last_name: nil)).to_not be_valid
    end

    it 'is not valid without a language' do
      expect(build(:user, language: nil)).to_not be_valid
    end

    it 'is not valid without a currency' do
      expect(build(:user, currency: nil)).to_not be_valid
    end

    it 'is not valid without a time_zone' do
      expect(build(:user, time_zone: nil)).to_not be_valid
    end
  end

  context 'Valid currency:' do
    it 'EUR is valid' do
      expect(build(:user, currency: 'EUR')).to be_valid
    end
    it 'USD is valid' do
      expect(build(:user, currency: 'USD')).to be_valid
    end
    it 'other is invalid' do
      expect(build(:user, currency: 'JPY')).to_not be_valid
    end
  end

  context 'Valid language:' do
    it 'it is valid' do
      expect(build(:user, language: 'it')).to be_valid
    end
    it 'en is valid' do
      expect(build(:user, language: 'en')).to be_valid
    end
    it 'other is invalid' do
      expect(build(:user, language: 'de')).to_not be_valid
    end
  end

  context 'Valid time_zone:' do
    it 'only a tzinfo zone is valid' do
      expect(build(:user, time_zone: 'UTC')).to be_valid
    end
    it 'other is invalid' do
      expect(build(:user, time_zone: 'US/Centrl')).to_not be_valid
    end
  end
end
