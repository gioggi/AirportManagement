# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Airport, type: :model do
  context 'healthy airport' do
    it 'is valid with valid attributes' do
      expect(build(:airport)).to be_valid
    end

    it 'is not valid without a name' do
      expect(build(:airport, name: nil)).to_not be_valid
    end

    it 'is not valid without a city' do
      expect(build(:airport, city: nil)).to_not be_valid
    end
  end
end
