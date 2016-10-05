Rails.application.routes.draw do

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  # Authenticate route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: :login_action
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:create]

end
