Rails.application.routes.draw do
  root to: "home#index"

  resources :buckets, only: [:index] do
    get 'productos', to: 'buckets#show', on: :member
    resources :productos, only: [:new, :create, :edit, :update, :destroy]
  end  

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy], path_names: { new: 'login', destroy: 'logout' }
end
