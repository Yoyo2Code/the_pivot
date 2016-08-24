Rails.application.routes.draw do

  root 'root#index'

  get '/cart', to: "cart#index", as: 'cart'

  resources :cart_items, only: [:create]

  resources :businesses, only: [:new, :create, :edit, :update, :destroy]


  namespace :platform_admin do
    resources :businesses, only: [:index, :update]
  end

  delete "/cart_items", to: 'cart_items#destroy'

  get '/login', to: 'sessions#new', as: 'login'

  post '/login', to: 'sessions#create'

  resources :orders, only: [:create, :index, :show, :destroy]

  get '/dashboard', to: 'users#show', as: 'dashboard'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create, :edit, :update]

  namespace :locations do
    get '/:city', to: 'properties#index'
  end

  namespace :api do
    namespace :v1 do
      get '/locations/:slug', to: 'locations/properties#index', as: "city"
      get '/businesses/:slug', to: 'businesses/properties#index', as: "name"
      get '/properties/:property_id', to: 'properties#show'
      get '/:property_scope', to: 'properties#index', as: "properties"
    end
  end

  namespace :admin do
    resources :businesses, only: [:edit, :update]
    get '/:business_name/edit/:id', to: "properties#edit", as: "edit_property"
    patch '/:business_name/:id', to: "properties#update", as: "update_property"
  end

  get '/:business_name/:id', to: "properties#show", as: "property"

  get '/:business_name', to: 'properties#index', as: "properties"


  #   # resources :items
  #   resources :users, only: [:new, :create, :show]
  #
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
