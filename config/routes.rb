Rails.application.routes.draw do
  get 'users/index'

  root 'users#index'
  get '/users/' => 'users#index', as: 'user'
  post '/users' => 'users#create'
  get '/users/new' => 'users#new'
  get '/users/:id' => 'users#show', as: 'show'
  patch '/users/update/:id' => 'users#update', as: 'update'

  get '/edit/:id' => 'users#edit', as: 'edit'

  delete '/destroy/:id' => 'users#destroy', as: 'destroy'
  
  post '/sessions/new' => 'sessions#create'
  get '/sessions/new' => 'sessions#new', as: 'new'
  post '/sessions/out' => 'sessions#destroy'

  get '/secrets' => 'secrets#index'
  post '/secrets/create' => 'secrets#create', as: 'create'
  delete '/secrets/:id' => 'secrets#destroy'

  post '/likes' => 'likes#index'
  post '/unlikes' => 'likes#destroy'
 
end
