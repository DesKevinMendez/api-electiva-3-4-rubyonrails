Rails.application.routes.draw do
  # use_doorkeeper
  devise_for :users

  resources :roles

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end
end
