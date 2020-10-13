json.partial! @flight, as: :flight
json.seats do
  json.partial! 'api/v1/seats/seat', collection: @flight.seats, as: :seat
end
