Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :index
  resources :categories, only: :show
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]

  delete "/cart_items", to: 'cart_items#destroy'
  get "/cart_items", to: 'cart_items#create'
end
