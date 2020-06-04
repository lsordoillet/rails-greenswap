Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings do
    resources :chatrooms, only: [:create, :new, :update, :show] # which ones do we need? chatroom lecture only has show, but I guess we need most of these?

    # right now its http://localhost:3000/listings/2/chatrooms/1
    # but does this make sense? can a listing have many chatrooms/bookings? I guess yes, because multiple people could start a booking for the same listing. 
    # what if seller confirms multiple bookings for the same listing?
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/profile", to: 'dashboard#profile'
end
