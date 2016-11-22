Rails.application.routes.draw do
  # Rails endpoints
  resources :users
  get '/users/new', to: 'api/users#new'
  get '/kitchens', to: 'kitchens#index'
  get '/kitchens/new', to: 'kitchens#new'

  # API endpoints
  post '/api/users', to: 'api/users#create'
  get '/api/kitchens', to: 'api/kitchens#index'
  post '/api/kitchens', to: 'api/kitchens#create'
end
