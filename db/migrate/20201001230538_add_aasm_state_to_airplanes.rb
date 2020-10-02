class AddAasmStateToAirplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :airplanes, :aasm_state, :string
  end
end
