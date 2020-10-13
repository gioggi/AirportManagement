# frozen_string_literal: true

json.array! @flights, partial: 'api/v1/flights/flight', as: :flight
