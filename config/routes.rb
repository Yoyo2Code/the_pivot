Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'users#show', as: 'dashboard'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create]
  namespace :location do
    get '/:city', to: 'properties#index'
  end


  namespace :api do
    namespace :v1 do
      get '/:business_name', to: 'properties#index', as: "properties"
      get '/location/:city', to: 'location/properties#index', as: "city"
    end
  end

  get '/:business_name/:id', to: "properties#show", as: "property"

  get '/:business_name', to: 'properties#index', as: "properties"

  # root 'items#index'
  #   # resources :items
  #   # resources :cart_items, only: [:create]
  #   # resources :cart, only: [:index]
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
