# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get '/', to: 'home#index'

  mount Sidekiq::Web => '/sidekiq'
  
  namespace :api do
    namespace :v1 do
      resources :dressmakers
      resources :service_orders
      resources :customers
      get 'customers', to: 'customers#search'
      get 'states', to: 'states_and_cities#states'
      get 'states/:state', to: 'states_and_cities#state_cities'
    end
  end

  post 'export_db_job/trigger_job'
  get 'export_db_job/job_done'
  get 'export_db_job', to: 'export_db_job#index'
end
