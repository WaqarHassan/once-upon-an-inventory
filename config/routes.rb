Rails.application.routes.draw do
  resources :drugs_stocks , except: :destroy
  resources :invoice_drugs , except: :destroy
  resources :invoices, except: [:destroy] do
    get :pdf
  end
  resources :drugs ,except: :destroy
  resources :companies , except: :destroy
  resources :distributors , except: :destroy
  devise_for :users
  resources :users
  # get "/reports" => "reports#index" , as: :reports_index
  resources :reports , only: [:index]
  root 'invoices#new'
  # get 'renew/:id' => 'orders#renew'
  # get 'return/:id' => 'orders#disable'
  # get 'past_orders' => 'orders#old'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
