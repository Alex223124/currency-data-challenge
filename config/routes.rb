Rails.application.routes.draw do
  resources :exchange_operations, only: [:index, :show, :new, :create]
  resources :exchange_rates, only: [:new, :create]
end
