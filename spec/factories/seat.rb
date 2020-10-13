# frozen_string_literal: true

# spec/factories.rb

FactoryBot.define do
  factory :seat do
    number { Faker::Number.number(digits: 2) }
    booking_date { DateTime.now }
    price { Faker::Commerce.price(range: 0.1..10.0) }
    flight { create(:flight) }
    passenger { create(:passenger) }
  end
end
