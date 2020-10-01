# spec/factories.rb

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    language { 'it' }
    time_zone { 'UCT' }
    currency { 'USD' }
  end
end
