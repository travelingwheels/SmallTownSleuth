Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  delete '/logout' => 'sessions#destroy'


  resources :towns do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :comments
  resources :reviews do
    resources :comments, only: [:index, :new, :create]
  end
  resources :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
