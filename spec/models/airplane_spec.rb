# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Airplane, type: :model do
  context 'healthy airplane: ' do
    it 'is valid with valid attributes' do
      expect(build(:airplane)).to be_valid
    end

    it 'is not valid without a name' do
      expect(build(:airplane, name: nil)).to_not be_valid
    end

    it 'is not valid without a n_number' do
      expect(build(:airplane, n_number: nil)).to_not be_valid
    end

    it 'is not valid with same a n_number' do
      n_number = Faker::Lorem.characters(number: 10)
      create(:airplane, n_number: n_number)
      expect(build(:airplane, n_number: n_number)).to_not be_valid
    end

    it 'valid without a airport' do
      expect(create(:airplane, airport: nil)).to be_valid
    end

    it 'is not valid without seats_numbers' do
      expect(build(:airplane, seats_numbers: nil)).to_not be_valid
    end

    it 'is not valid with seats_numbers < 1' do
      expect(build(:airplane, seats_numbers: 0)).to_not be_valid
    end
  end
end
