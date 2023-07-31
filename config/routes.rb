# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'service_orders#index' # TODO: Add a dashboard

  resources :customers
  resources :dressmakers
  resources :service_orders

  namespace :api do
    namespace :v1 do
      get 'states', to: 'states_and_cities#states'
      get 'states/:state', to: 'states_and_cities#state_cities'
    end
  end

  post 'export_db_job/trigger_job'
  get 'export_db_job/job_done'
  get 'export_db_job', to: 'export_db_job#index'
end
