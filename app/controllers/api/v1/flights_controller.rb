class Api::V1::FlightsController < ActionController::API
  respond_to :json
  def index
    @flights = Flight.active_flights
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
