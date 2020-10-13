require 'rails_helper'

RSpec.describe 'Flights', type: :request do
  describe 'GET flights#index' do
    it 'should get index' do
      get '/api/v1/flights'
      expect(response).to render_template(:index)
    end

    it 'should get index' do
      flight = create(:flight)
      get '/api/v1/flights/' + flight.id.to_s
      expect(response).to render_template(:show)
    end
  end
end
