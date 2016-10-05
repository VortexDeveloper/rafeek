Rails.application.routes.draw do
  get 'user/show'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "application#index"
end
