class Passenger < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :passport, format: { with: /\d{9}/ }, allow_blank: true, length: { is: 9 }
  validates_with DocumentValidator
end
