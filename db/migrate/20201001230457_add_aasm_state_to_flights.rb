# frozen_string_literal: true

class AddAasmStateToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :aasm_state, :string
  end
end
