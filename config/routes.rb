Rails.application.routes.draw do
  root "customers#index" # TODO: Add a dashboard

  get "/customers", to: "customers#index"
end
