Rails.application.routes.draw do

  root "static_pages#home"
  get '/hello',   to: 'static_pages#hello'
  get '/home',    to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end
