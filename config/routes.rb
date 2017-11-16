Rails.application.routes.draw do
  resources :apartments
  get 'basic_search' => 'apartments#basic_search'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'apartments#index'
end
