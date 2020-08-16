Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'


  resources :towns do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :users 
  resources :reviews
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
