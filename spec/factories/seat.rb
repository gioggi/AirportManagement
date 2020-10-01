# spec/factories.rb

FactoryBot.define do
  factory :seat do
    number { Faker::Number.number(digits: 2)  }
    booking_date {  DateTime.now }
    price { Faker::Commerce.price }
    flight { create(:flight)  }
    passenger { create(:passenger)}
  end
end