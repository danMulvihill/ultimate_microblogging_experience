Rails.application.routes.draw do

  
  resources :coms
  get 'about' => 'about#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  
  post 'logout' => 'sessions#destroy'
  
  resources :posts
  resources :users
  resources :comments

  root 'welcome#index'

  
end

