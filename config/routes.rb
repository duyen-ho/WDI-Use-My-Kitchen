Rails.application.routes.draw do
  # Rails endpoints
  resources :users
  get '/users/new', to: 'api/users#new'
  root to: 'pages#index'
  get '/kitchens', to: 'kitchens#index'
  get '/kitchens/new', to: 'kitchens#new'
  get '/kitchens/:id', to: 'kitchens#show'
  get '/kitchens/:id/edit', to: 'kitchens#edit'
  # API endpoints
  post '/api/users', to: 'api/users#create'
  get '/api/kitchens', to: 'api/kitchens#index'
  post '/api/kitchens', to: 'api/kitchens#create'
  patch '/api/kitchens/:id', to: 'api/kitchens#update'
  post '/api/bookings', to: 'api/bookings#create'
  # Sessions
  get '/session/new', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/logout', to: 'session#destroy'
end
