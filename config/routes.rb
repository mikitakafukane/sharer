Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    # sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :chats, only: [:create, :destroy]
  resources :posts, only: [:index, :show, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  post '/tasks/:id/done' => 'tasks#done', as: 'done'
  resources :events, only: [:index, :create, :edit, :update, :destroy]
  resources :rooms, only: [:index, :create, :show, :edit, :update]
  resources :contacts, only: [:new, :create]

  get '/homes/about', to: 'homes#about'

  root 'homes#top'
end
