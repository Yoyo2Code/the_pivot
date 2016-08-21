Rails.application.routes.draw do

  root 'root#index'

  get '/cart', to: "cart#index", as: 'cart'

  resources :cart_items, only: [:create]
  resources :businesses, only: [:new, :create]

  delete "/cart_items", to: 'cart_items#destroy'

  get '/login', to: 'sessions#new', as: 'login'

  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'users#show', as: 'dashboard'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create, :edit, :update]

  namespace :location do
    get '/:city', to: 'properties#index'
  end

  namespace :api do
    namespace :v1 do
      get '/:business_name', to: 'properties#index', as: "properties"
      get '/location/:city', to: 'location/properties#index', as: "city"
      get '/properties/:property_id', to: 'properties#show'
    end
  end

  get '/:business_name/:id', to: "properties#show", as: "property"

  get '/:business_name', to: 'properties#index', as: "properties"


  #   # resources :items
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
  #   get '/dashboard', to: 'users#show'
  #
  #
end
