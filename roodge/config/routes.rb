Rails.application.routes.draw do

  get 'home/index'
  #GET /about
  get "about", to: "about#index"

  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
