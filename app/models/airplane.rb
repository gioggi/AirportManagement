class Airplane < ApplicationRecord
  belongs_to :airport, :optional =>  true
  validates_presence_of :name, :n_number
  validates_uniqueness_of :n_number
  validates :seats_numbers, numericality: { less_than_or_equal_to: 300,  only_integer: true }
end
