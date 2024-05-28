Rails.application.routes.draw do
  root to: "home#index"

  resources :buckets, only: [:index, :new] do
    get 'productos', to: 'productos#index_for_bucket', on: :member, as: 'productos'
  end

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy], path_names: { new: 'login', destroy: 'logout' }
end
