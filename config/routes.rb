Rails.application.routes.draw do
  resources :towns
  resources :users
  resources :reviews
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
