# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :number, unique: true
      t.datetime :departure_time
      t.datetime :arrival_time
      t.belongs_to :arrival_airport, foreign_key: { to_table: :airports }
      t.belongs_to :departure_airport, foreign_key: { to_table: :airports }
      t.belongs_to :airplane
      t.timestamps
    end
  end
end
