# frozen_string_literal: true

class CreateAirplanes < ActiveRecord::Migration[6.0]
  def change
    create_table :airplanes do |t|
      t.string :name
      t.string :n_number, unique: true
      t.integer :seats_numbers
      t.belongs_to :airport, optional: true
      t.timestamps
    end
  end
end
