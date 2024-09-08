Rails.application.routes.draw do
  
  root 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'delete', to: 'sessions#destroy' 

  get 'home_logged', to: 'home#home_logged', as: :home_logged

  get "about-us", to: "about#index", as: :about

  get 'registration', to: 'registrations#new', as: :registration
  post 'registration', to: 'registrations#create'

  get "info_professor", to: "home#info_professor"
  get "info_student", to: "home#info_student"

  get 'room', to: 'rooms#index', as: :room

  post 'auth/google_oauth2', to: 'sessions#create', as: :google_login
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  delete 'logout', to: 'sessions#destroy'
end