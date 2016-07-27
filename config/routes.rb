Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :index
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  resources :categories, only: [:show], param: :title

  delete "/cart_items", to: 'cart_items#destroy'
  get "/cart_items", to: 'cart_items#create'
end
