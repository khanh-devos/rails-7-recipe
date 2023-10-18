Rails.application.routes.draw do
  devise_for :users
  
  resources :foods, only: [:index, :create, :new]

  root 'foods#index'
end