ActiveAdmin.register Airplane do
  permit_params :name, :n_number, :seats_numbers, :airport_id
end
