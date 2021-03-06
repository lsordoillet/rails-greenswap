Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings do
    resources :chatrooms, only: :create  # which ones do we need? chatroom lecture only has show, but I guess we need most of these?
    # what if seller confirms multiple bookings for the same listing?
    resources :favorites, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/profile", to: 'dashboard#profile'
  resources :chatrooms, only: [:update, :show, :index] do
    resources :messages, only: :create
    resources :reviews, only: [:new, :create]
  end

  resources :favorites, only: :destroy

  get "/profile/:current_user_id/edit", to: 'dashboard#edit', as: :profile_edit
  patch "/profile/:current_user_id/", to: 'dashboard#update', as: :profile_update

end
