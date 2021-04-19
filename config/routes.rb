Rails.application.routes.draw do
  namespace :api do
    resources :zones, only: [:index]
  end
end
