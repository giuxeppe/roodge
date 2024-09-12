
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
  
    get "info_user", to: "home#info_user"
    get 'room_unlogged/:id', to: 'home#room_unlogged', as: 'room_unlogged'
    get "room_logged/:id", to: "home#room_logged", as: "room_logged"
    get "create_room", to: "home#create_room"
    get "other_user_info", to: "home#other_user_info", as: "other_user_info"
    get "add_material", to: "home#add_material"
  
    get 'room', to: 'rooms#index', as: :room
  
    get 'auth', to: 'home#index'
  
    get "rooms/search", to: "rooms#search"
  
    resources :create_room, only: [:new, :create]
    resources :add_material, only: [:new, :create]
  
    resources :rooms, only: [:index] do
      collection do
        get :search
      end
    end
  end
  