Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/users/sign_out', to: "users#user_sign_out"
  root "recipes#index"

  resources :users, only: %i[show] do
    resources :foods, only: %i[index show new create destroy]
    resources :recipes, only: %i[index show new create destroy] do
      resources :recipe_foods, only: %i[new create edit update destroy]
    end
  end


  get '/users/:user_id/public_recipes', to: "recipes#public_index", as: "public_recipes"

  get '/users/:user_id/shopping_list', to: "recipes#shopping_list", as: "shopping_list"
  
  post '/users/:user_id/recipes/:id', to: "recipes#modify_public", as: "recipe_modify" 

end
