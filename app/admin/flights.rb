# frozen_string_literal: true

ActiveAdmin.register Flight do
  permit_params :number, :departure_time, :arrival_time, :arrival_airport_id, :departure_airport_id, :airplane_id
end
