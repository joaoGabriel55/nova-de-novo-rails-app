# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index' # TODO: Add a dashboard

  resources :customers, only: %i[index new create edit]
end
