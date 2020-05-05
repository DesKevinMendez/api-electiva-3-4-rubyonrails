Rails.application.routes.draw do
  
  # use_doorkeeper
  devise_for :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do 
      resources :warehouses
      resources :users, only: [:index, :show]
      get "users/byrole/:role_id", to: "users#byrole" 
      resources :roles
      resources :shelves
      resources :inventories
      resources :shelves_inventories
      resources :departures
      resources :departure_details  
      resources :entries
      resources :entry_details

      resources :product_types
      resources :providers
      resources :brands
      resources :models
      resources :products

      
    end
  end

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end

  # simple route
  post 'register/create'
  
end
