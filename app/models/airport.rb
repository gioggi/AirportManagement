class Airport < ApplicationRecord
  validates :name, :city, presence: true
end
