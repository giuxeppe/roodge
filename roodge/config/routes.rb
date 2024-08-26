Rails.application.routes.draw do

  get 'home/index'
  #GET /about
  get "about-us", to: "about#index", as: :about
  get "home/home_logged", to: "home#home_logged"
  get "registration", to: "home#registration"
  get "home/final_registration", to: "home#final_registration"
  get "info_professor", to: "home#info_professor"
  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
