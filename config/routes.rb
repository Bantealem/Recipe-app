Rails.application.routes.draw do
  get 'foods/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"


  # resources :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy]

  resources :foods, only: [:index, :show, :new, :create, :destroy]




end
