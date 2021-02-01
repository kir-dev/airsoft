Rails.application.routes.draw do
  resources :users
  resources :event_types
  resources :events
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
end
