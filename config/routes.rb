Rails.application.routes.draw do
  get 'general_shopping_lists', to: 'general_shoping_lists#index', as: 'general_shopping'
  get 'public_recipes', to: 'public_recipes#index'
  get 'public_recipes/:id', to: 'public_recipes#show', as:'show_public_recipes'
  
  # get 'general_shoping_list',to: :new

  get 'recipes/index'
  get 'foods/index'

  get "recipe/:recipe_id/ingredient", to: "ingredients#new", as: 'new_ingredient'
  post "recipe/:recipe_id/ingredient", to: "ingredients#create", as: 'create_ingredient'

  delete "recipe/:recipe_id/ingredient/:id", to: "ingredients#destroy", as: "delete_ingredient"

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        
      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "session#new"


  # resources :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy]

  resources :foods, only: [:index, :show, :new, :create, :destroy]




end
