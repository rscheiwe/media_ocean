Rails.application.routes.draw do
  resources :relationships
  resources :reviews
  resources :users
  resources :movies


  root to: 'movies#welcome', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  get '/about', to: 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
