# spec/factories.rb

FactoryBot.define do
  factory :airport do
    name {Faker::Movies::LordOfTheRings.character }
    city { Faker::Movies::LordOfTheRings.location }
  end
end