Rails.application.routes.draw do
  
  devise_for :user_providers, controllers: { 
    registrations: 'user_providers/registrations',
    sessions: 'user_providers/sessions',
    omniauth_callbacks: 'user_providers/omniauth_callbacks'
  }

  root 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'

  get 'home_logged', to: 'home#home_logged', as: :home_logged

  get "about-us", to: "about#index", as: :about

  get 'registration', to: 'registrations#new', as: :registration
  post 'registration', to: 'registrations#create'

  get "info_professor", to: "home#info_professor"
  get "info_student", to: "home#info_student"
  get "room_unlogged", to: "home#room_unlogged"
  get "room_logged", to: "home#room_logged"
  get "create_room", to: "home#create_room"

  get 'room', to: 'rooms#index', as: :room
end