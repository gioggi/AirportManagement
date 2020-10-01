class Airplane < ApplicationRecord
  belongs_to :airport, optional: true
  validates :name, :n_number, :seats_numbers, presence: true
  validates :n_number, uniqueness: true
  validates :seats_numbers, numericality: { greater_than: 0, less_than_or_equal_to: 300, only_integer: true }
end
