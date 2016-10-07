Rails.application.routes.draw do
  get 'user/edit'
  get 'user/show'
  get 'profile/edit'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "application#index"

  resources :packages

end
