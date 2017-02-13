Rails.application.routes.draw do

  root "static_pages#home"
  get '/home',      to: 'static_pages#home'
  get '/help',      to: 'static_pages#help'
  get '/about',     to: 'static_pages#about'
  get '/contact',   to: 'static_pages#contact'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/scorekeeper',   to: 'play_sessions#new'
  post '/scorekeeper',  to: 'play_sessions#create'
  patch '/scorekeeper', to: 'play_sessions#update'
  delete '/scorekeeper', to: 'play_sessions#reset'
  resources :users
end
