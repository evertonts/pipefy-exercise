Rails.application.routes.draw do
  resources :organizations, only: [:index, :create]

  root 'organizations#index'
end
