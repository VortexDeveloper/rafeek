Rails.application.routes.draw do
  post 'package_transaction/purchase'
  get 'validate_purchase/:id' => 'package_transaction#validate_purchase', as: 'validate_purchase'

  get 'user/edit'
  get 'user/show'
  get 'user/tickets'
  get 'user/points'

  get 'profile/edit'
  patch 'profile/update'
  post 'ticket_transaction/purchase'
  post 'packages/purchase'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks",
      :registrations => 'users/registrations'
   }


  root to: "pages#index"

  resources :packages
  resources :partners
  resources :raffles
  resources :coupons
  resources :newsletters

  #Public Pages
  get 'pages/index'
  get 'pages/raffles'
  get 'pages/packages'
  get 'pages/raffles_new'
  get 'pages/raffles_hot'
  get 'pages/winners'
  get 'pages/raffles_categories'
  get 'pages/help'
  get 'pages/winners'

  get 'raffles/raffle_select/:id' => 'raffles#raffle_select', as: 'raffle_select'
end
