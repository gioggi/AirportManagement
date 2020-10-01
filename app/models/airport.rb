class Airport < ApplicationRecord
  validates_presence_of :name, :city
end
