# frozen_string_literal: true

class Airport < ApplicationRecord
  validates :name, :city, presence: true
end
