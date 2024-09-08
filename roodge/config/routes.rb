Rails.application.routes.draw do
  root 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'home_logged', to: 'home#home_logged', as: :home_logged

  get "about-us", to: "about#index", as: :about

  get 'registration', to: 'registrations#new', as: :registration
  post 'registration', to: 'registrations#create'

  get "info_professor", to: "home#info_professor"
  get "info_student", to: "home#info_student"
end