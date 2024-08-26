Rails.application.routes.draw do

  #get 'registrations/new'
  #get 'registrations/create'
  #get 'registrations/edit'
  #get 'registrations/update'
  #get 'home/index'
  #GET /about
  get "about-us", to: "about#index", as: :about
  get "home/home_logged", to: "home#home_logged"
  get "registration", to: "home#registration"
  get "final_registration", to: "home#final_registration"
  get "home/final_registration", to: "home#final_registration"

  root "home#index"

  resources :registrations, only: [:new, :create] do
    member do
      get 'edit_final', to: 'home#final_registration'
      patch 'update_final', to: 'registrations#update_final'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
