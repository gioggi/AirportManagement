class FlightsController < ApplicationController

  def index
    render json: Flight.all.to_json, status: :ok
  end
end
