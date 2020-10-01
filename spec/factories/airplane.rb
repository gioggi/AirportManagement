# spec/factories.rb

FactoryBot.define do
  factory :airplane do
    name { Faker::Movies::StarWars.droid }
    n_number { Faker::Lorem.characters(number: 10) }
    seats_numbers { 120 }
    airport { create(:airport) }
  end
end
