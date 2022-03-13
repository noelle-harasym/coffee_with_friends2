Rails.application.routes.draw do
  resources :dairy_types
  resources :coffee_types
  resources :coffee_orders
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
