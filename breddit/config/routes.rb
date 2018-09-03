Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :destroy]
  resources :posts
  resources :comments, only: [:new, :create, :index]
  resources :votes, only: [:create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'my_posts', action: :my_posts, controller: 'posts'
end