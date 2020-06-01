Rails.application.routes.draw do
  root 'posts#index'
  get '/identities/new' => 'identities#new'
  post '/identities' => 'identities#create'
  post '/likes' => 'likes#new'
  get '/login' => 'sessions#new'
  post 'login' => 'posts#index'
  resources :comments
  resources :communities
  resources :posts
  resources :likes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
