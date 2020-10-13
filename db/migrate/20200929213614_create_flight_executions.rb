# frozen_string_literal: true

class CreateFlightExecutions < ActiveRecord::Migration[6.0]
  def change
    create_table :flight_executions do |t|
      t.datetime :departure_time
      t.datetime :arrival_time
      t.belongs_to :flight
      t.timestamps
    end
  end
end
