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
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  resources :events
  resources :rooms do
    get 'belongings/index'
  end

  root 'homes#top'

end
