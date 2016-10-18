Rails.application.routes.draw do
  get 'user/edit'
  get 'user/show'
  get 'profile/edit'
  patch 'profile/update'
  post 'ticket_transaction/purchase'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks",
      :registrations => 'users/registrations'
   }
  root to: "application#index"

  resources :packages
  resources :partners
  resources :raffles
  resources :coupons

end
