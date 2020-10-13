# frozen_string_literal: true

module Api
  module V1
    class FlightsController < ActionController::API
      respond_to :json
      def index
        @flights = Flight.active_flights
      end

      def show
        @flight = Flight.find(params[:id])
      end
    end
  end
end
