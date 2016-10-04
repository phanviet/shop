Rails.application.routes.draw do

  # Authenticate route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: :login_action
  delete 'logout', to: 'sessions#destroy'
  # get 'sessions/new'

  # get 'sessions/destroy'

end
