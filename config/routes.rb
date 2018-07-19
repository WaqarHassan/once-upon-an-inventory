Rails.application.routes.draw do
  resources :drugs_stocks
  resources :invoice_drugs
  resources :invoices, except: [:destroy] do
    get :pdf
  end
  resources :drugs
  resources :companies
  resources :distributors
  devise_for :users
  resources :users
  
  root 'invoices#new'
  # get 'renew/:id' => 'orders#renew'
  # get 'return/:id' => 'orders#disable'
  # get 'past_orders' => 'orders#old'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
