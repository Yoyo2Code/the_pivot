Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :index
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  # resources :categories, only: [:show], param: :title
  resources :users, only: [:new, :create, :show]

  delete "/cart_items", to: 'cart_items#destroy'
  get "/cart_items", to: 'cart_items#create'
  post "/login", to: 'sessions#create'
  get "/login", to: 'sessions#new'

  get "/:category_title", to: 'categories#show'
end
