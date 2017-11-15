Rails.application.routes.draw do
  resources :apartments
  get 'basic_search' => 'apartments#basic_search'
end
