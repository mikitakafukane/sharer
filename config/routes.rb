Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :chats, only: [:show, :create, :destroy]
  
end
