
Rails.application.routes.draw do
  
    devise_for :user_providers, controllers: { 
      omniauth_callbacks: 'user_providers/omniauth_callbacks'
    }

    root 'home#index'
  
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'login', to: 'sessions#destroy'

    get 'sessions_google/destroy_google', to: 'sessions_google#destroy_google', as: :destroy_google
  
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
  
    get "all_rooms_unlogged", to: "home#all_rooms_unlogged"
    get "add_commenti/:materiale_id", to: "home#add_commenti", as: :add_commenti
    post "add_commenti/:materiale_id", to: "add_commenti#create"
    get "payment", to: "home#payment"
    post 'ban_user', to: 'bans#create', as: 'ban_user'
    post 'approve_material', to: 'materials#approve', as: 'approve_material'

    resources :create_room, only: [:new, :create]
    resources :add_material, only: [:new, :create]
    resources :add_commenti, only: [:new, :create]
  
    resources :rooms, only: [:index] do
      collection do
        post :search
      end
    end
  end
  