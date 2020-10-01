
json.partial! @flight, as: :flight
json.seats do
json.partial! 'seats/seat', collection: @flight.seats, as: :seat
end