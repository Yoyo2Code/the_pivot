Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :index
  resources :cart_items, only: [:create]
  resources :cart, only: [:index, :update]
  # post '/update/:id', to: "cart#update_quantity_by"
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:create, :index]

  delete "/cart_items", to: 'cart_items#destroy'
  get "/cart_items", to: 'cart_items#create'
  post "/login", to: 'sessions#create'
  get "/login", to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get "/:category_title", to: 'categories#show'

end
