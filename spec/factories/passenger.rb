# frozen_string_literal: true

# spec/factories.rb

FactoryBot.define do
  factory :passenger do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    passport { Faker::Number.number(digits: 9) }
    on_board { false }
    user { create(:user) }
  end
end
