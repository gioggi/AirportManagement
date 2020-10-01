# spec/factories.rb

FactoryBot.define do
  factory :flight_execution do
    departure_time { DateTime.now }
    arrival_time { DateTime.now + rand(600).minutes }
    flight { create(:flight) }
  end
end
