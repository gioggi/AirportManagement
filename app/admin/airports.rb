# frozen_string_literal: true

ActiveAdmin.register Airport do
  permit_params :name, :city
end
