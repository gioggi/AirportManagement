Rails.application.routes.draw do
  ActiveAdmin::Devise.config[:controllers][:sessions] = 'admin/sessions'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # defaults format: :json do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :flights, only: %i[index show]
      devise_scope :user do
        post 'sign_up', to: 'registrations#create'
        post 'sign_in', to: 'sessions#create'
      end
    end
  end
end
