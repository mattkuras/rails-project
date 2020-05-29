Rails.application.routes.draw do
  get '/identities/new' => 'identities#new'
  resources :comments
  resources :communities
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
