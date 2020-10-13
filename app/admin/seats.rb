ActiveAdmin.register Seat do
  permit_params :number, :booking_date, :price, :flight_id, :passenger_id

  filter :flight_id, as: :select, collection: Flight.to_option
  filter :number
end
