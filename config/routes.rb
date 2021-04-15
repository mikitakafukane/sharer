Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :chats, only: [:show, :create, :destroy]
  resources :posts, only: [:index, :create, :destroy] do
    resource :likes,    only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :tasks
  resources :events
  
  root 'homes#top'
  
end
