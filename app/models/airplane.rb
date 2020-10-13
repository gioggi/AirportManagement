# frozen_string_literal: true

class Airplane < ApplicationRecord
  belongs_to :airport, optional: true
  validates :name, :n_number, :seats_numbers, presence: true
  validates :n_number, uniqueness: true
  validates :seats_numbers, numericality: { greater_than: 0, less_than_or_equal_to: 300, only_integer: true }

  include AASM

  aasm do
    state :ground, initial: true
    state :in_air

    event :start do
      transitions from: :ground, to: :in_air
    end

    event :to_ground do
      transitions from: :in_air, to: :ground
    end
  end
end
