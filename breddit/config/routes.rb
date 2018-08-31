Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
