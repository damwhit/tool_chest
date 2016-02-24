Rails.application.routes.draw do

  resources :tools

  resources :users, only: [:new, :index, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'users#index'
end
