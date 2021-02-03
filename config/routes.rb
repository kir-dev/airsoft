Rails.application.routes.draw do

  resources :participations
  resources :rents
  resources :items
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  resources :users
  resources :event_types
  resources :events
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Temporary configurations
  root to: 'posts#index'
  # get '/gallery', to: 'albums#gallery' ???
  get '/calendar', to: 'events#calendar', as: 'calendar'
  get '/about', to: 'posts#about', as: 'about'
end
