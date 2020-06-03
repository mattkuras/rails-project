Rails.application.routes.draw do
  root 'posts#index'
  get '/identities/new' => 'identities#new'
  post '/identities' => 'identities#create'
  post '/likes' => 'likes#new'
  get '/login' => 'sessions#new', as: 'login'
  post 'login' => 'posts#index'
  get 'logout' => 'sessions#destroy'
  reseources :communities, only: [:show] do 
    reources :posts, only: [:show, :index, :new, :create]
  resources :comments
  resources :communities
  resources :posts
  resources :likes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
resources :authors, only: [:show] do
  # nested resource for posts
  resources :posts, only: [:show, :index]