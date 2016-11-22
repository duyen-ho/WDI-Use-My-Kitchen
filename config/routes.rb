Rails.application.routes.draw do
  # Rails endpoints
  resources :users
  get '/users/new', to: 'api/users#new'
  get '/kitchens', to: 'kitchens#index'

  # API endpoints
  post '/api/users', to: 'api/users#create'
  get '/api/kitchens', to: 'api/kitchens#index'
  get '/session/new', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/logout', to: 'session#destroy'
end
