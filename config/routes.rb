Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings, only: [:new, :edit, :show, :create, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/profile", to: 'dashboard#profile'
  get "/profile/:current_user_id/edit", to: 'dashboard#edit', as: :profile_edit
  patch "/profile/:current_user_id/", to: 'dashboard#update', as: :profile_update
end
