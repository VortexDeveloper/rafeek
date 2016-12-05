require 'sidekiq/web'
Rails.application.routes.draw do
  post 'package_transaction/purchase'
  post 'validate_purchase/:id' => 'package_transaction#validate_purchase', as: 'validate_purchase'
  get 'validate_purchase/:id' => 'package_transaction#validate_purchase', as: 'get_validate_purchase'

  get 'user/edit'
  get 'user/show'
  get 'user/tickets'
  get 'user/points'
  get 'user/index'
  get 'user/edit_admin/:id' => 'user#edit_admin', as: 'edit_admin'

  post 'ticket_transaction/purchase'
  post 'packages/purchase'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks",
      :registrations => 'users/registrations'
   }


  root to: "pages#index"

  resources :packages
  resources :partners
  resources :raffles do
    get 'payback'
  end
  resources :coupons
  resources :newsletters
  resources :profile, only: [:edit, :update]
  get 'profile/edit'

  #Public Pages
  get 'pages/index'
  get 'pages/raffles'
  get 'pages/packages'
  get 'pages/raffles_new'
  get 'pages/raffles_hot'
  get 'pages/winners'
  get 'pages/raffles_categories/:category_id' => 'pages#raffles_categories', as: 'raffles_categories'
  get 'pages/help'
  get 'pages/terms'
  get 'pages/winners'
  get 'ticket/index' => 'ticket#index', as: 'tickets'

  get 'user/performed_transactions'
  get 'package_transaction/performed_transactions'
  get 'raffles/raffle_select/:id' => 'raffles#raffle_select', as: 'raffle_select'
  get 'packages/performed/:id' => 'packages#performed', as: 'performed'

  post 'send_partner_email' => 'pages#send_partner_email'
  post 'send_contact_email' => 'pages#send_contact_email'

  mount Sidekiq::Web => '/sidekiq'
  # mount RedisBrowser::Web => '/redis-browser'
end
