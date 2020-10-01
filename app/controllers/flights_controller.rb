class FlightsController < ApplicationController

  def index
    @flights = Flight.active_flights
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
