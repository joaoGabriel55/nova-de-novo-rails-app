# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index' # TODO: Add a dashboard

  resources :customers
  resources :dressmakers

  namespace :api do
    namespace :v1 do
      get 'states', to: 'states_and_cities#states'
      get 'states/:state', to: 'states_and_cities#state_cities'
    end
  end
end
