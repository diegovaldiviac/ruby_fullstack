Rails.application.routes.draw do
  root to: "home#index"

  get 'producto', to: 'producto#index'
  get 'producto/new', to: 'producto#new'
  get 'producto/:id', to: 'producto#show'
  post 'producto', to: 'producto#create'

  get 'signup', to: 'users#new' 
  resources :users
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 
end
