# frozen_string_literal: true

ActiveAdmin.register Passenger do
  permit_params :first_name, :last_name, :passport, :on_board, :user_id
end
