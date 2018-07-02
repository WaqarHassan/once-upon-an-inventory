Rails.application.routes.draw do
  resources :invoices, except: [:destroy]
  resources :drugs
  resources :companies
  resources :distributors
  devise_for :users
  resources :users

  
  root 'dashboard#index'
  # get 'renew/:id' => 'orders#renew'
  # get 'return/:id' => 'orders#disable'
  # get 'past_orders' => 'orders#old'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
