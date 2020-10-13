# spec/factories.rb

FactoryBot.define do
  factory :flight do
    number { Faker::Lorem.characters(number: 10) }
    departure_time { DateTime.now }
    arrival_time { DateTime.now + rand(600).minutes }
    departure_airport { create(:airport) }
    arrival_airport { create(:airport) }
    airplane { create(:airplane) }
    after(:create) do |flight|
      flight.reload
    end
  end
end
