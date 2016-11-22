Rails.application.routes.draw do

  resources :users
  get '/users/new', to: 'api/users#new'

  post '/api/users', to: 'api/users#create'

  get '/session/new', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/logout', to: 'session#destroy'

end
