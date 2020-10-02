class AddAasmStateToFlightExecutions < ActiveRecord::Migration[6.0]
  def change
    add_column :flight_executions, :aasm_state, :string
  end
end
