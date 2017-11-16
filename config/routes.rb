Rails.application.routes.draw do
  resources :apartments
  get 'basic_search' => 'apartments#basic_search'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'
  root 'apartments#index'
end
