Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
  root 'foods#index'
  post '/foods', to: 'foods#create'
end
