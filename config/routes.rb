Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  resources :users, only: [:new, :create, :show]

  resources :orders, only: [:create, :index, :show, :destroy]

  namespace :admin do
    resources :users, only: [:show, :edit, :update]
    get '/dashboard', to: 'users#show'
  end

  # delete "/orders", to: 'orders#destroy'
  delete "/cart_items", to: 'cart_items#destroy'
  get "/cart_items", to: 'cart_items#create'
  post "/login", to: 'sessions#create'
  get "/login", to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get "/:location_title", to: 'locations#show'

end
