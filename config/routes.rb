Rails.application.routes.draw do
  root to: "home#index"

  resources :buckets, only: [:index] do
    #get 'productos', to: 'productos#index_for_bucket', on: :member
    resources :productos, only: [:index, :new, :create, :edit, :update, :destroy], on: :collection
  end

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy], path_names: { new: 'login', destroy: 'logout' }
end
