Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :index
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:create, :index]

  namespace :admin do
    resources :users, only: [:show, :edit, :update]
    get '/dashboard', to: 'users#show'
  end

  delete "/cart_items", to: 'cart_items#destroy'
  get "/cart_items", to: 'cart_items#create'
  post "/login", to: 'sessions#create'
  get "/login", to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get "/:category_title", to: 'categories#show'

end
