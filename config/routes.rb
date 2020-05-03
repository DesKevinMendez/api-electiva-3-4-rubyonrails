Rails.application.routes.draw do
  
  # use_doorkeeper
  devise_for :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do 
      resources :warehauses
      resources :users, only: [:index, :show]
      resources :roles
  
    end
  end

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end

  # simple route
  post 'register/create'
  
end
