Rails.application.routes.draw do

  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  
  resources :posts
  resources :users
  resources :comments

  root 'welcome#index'
  
end

