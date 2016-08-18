Rails.application.routes.draw do

  resources :cart, only: [:index]
  
  namespace :location do
    get '/:city', to: 'properties#index'
  end

  get '/:business_name/:id', to: "properties#show", as: "property"

  get '/:business_name', to: 'properties#index', as: "properties"

  namespace :api do
    namespace :v1 do
      # get '/:category', to: 'properties#index', as: "properties"
      get '/:business_name', to: 'properties#index', as: "properties"
      get '/location/:city', to: 'location/properties#index', as: "city"
    end
  end


  # root 'items#index'
  #   # resources :items
  #   # resources :cart_items, only: [:create]
  #   resources :users, only: [:new, :create, :show]
  #
  #   resources :orders, only: [:create, :index, :show, :destroy]
  #
  #   namespace :admin do
  #     resources :users, only: [:show, :edit, :update]
  #     get '/dashboard', to: 'users#show'
  #   end
  #
  #   # delete "/orders", to: 'orders#destroy'
  #   delete "/cart_items", to: 'cart_items#destroy'
  #   get "/cart_items", to: 'cart_items#create'
  #   post "/login", to: 'sessions#create'
  #   get "/login", to: 'sessions#new'
  #   get '/logout', to: 'sessions#destroy'
  #
  #   get '/dashboard', to: 'users#show'
  #
  #
end
