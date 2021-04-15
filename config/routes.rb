Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :chats, only: [:show, :create, :destroy]
  resources :posts, only: [:index, :create, :destroy] do
    resource :likes,    only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :tasks
  resources :events
end
