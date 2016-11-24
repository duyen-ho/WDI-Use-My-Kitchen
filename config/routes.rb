Rails.application.routes.draw do
  # Rails endpoints
  resources :users
  get '/users/new', to: 'api/users#new'
  root to: 'pages#index'
  get '/kitchens', to: 'kitchens#index'
  get '/kitchens/new', to: 'kitchens#new'
  get '/kitchens/:id', to: 'kitchens#show'
  get '/kitchens/:id/edit', to: 'kitchens#edit'
  get '/bookings', to: 'bookings#index'
  get '/bookings/:id', to: 'bookings#show'
  get '/messages', to: 'messages#index'
  get '/messages/:user_id', to: 'messages#show'

  # API endpoints
  post '/api/users', to: 'api/users#create'
  get '/api/kitchens', to: 'api/kitchens#index'
  post '/api/kitchens', to: 'api/kitchens#create'
  patch '/api/kitchens/:id', to: 'api/kitchens#update'
  get '/api/bookings', to: 'api/bookings#index'
  post '/api/bookings', to: 'api/bookings#create'
  patch '/api/bookings/:id', to: 'api/bookings#cancel'
  get '/api/messages', to: 'api/messages#index'
  get '/api/messages/:user_id', to: 'api/messages#show'
  post '/api/messages', to: 'api/messages#create'
  # Sessions
  get '/session/new', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'
  # Kitchen reviews
  post '/api/kitchens/reviews', to: 'api/kitchen_reviews#create'
  get '/api/kitchens/reviews', to: 'api/kitchen_reviews#index'
end
