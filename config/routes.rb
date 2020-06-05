Rails.application.routes.draw do
  root 'posts#index'
  get '/identities/new' => 'identities#new'
  post '/identities' => 'identities#create'
  post '/likes' => 'likes#new'
  get '/login' => 'sessions#new', as: 'login'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :communities, only: [:show] do 
    resources :posts, only: [:show, :index, :new, :create]
  end
  resources :comments
  resources :communities
  resources :posts
  resources :likes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
