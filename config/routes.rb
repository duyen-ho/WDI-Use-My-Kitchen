Rails.application.routes.draw do

  resources :users
  get '/users/new', to: 'api/users#new'

  post '/api/users', to: 'api/users#create'
end
