Rails.application.routes.draw do
  resources :drugs_stocks do 
    collection do |c|
      get :drug_returns
      post :drug_returns
    end
  end #, except: :destroy
  resources :invoice_drugs #, except: :destroy
  resources :invoices , only: [:index, :show, :create, :new] do
    get :pdf
    member do
      match :delete , via: [:get, :post]
    end
  end
  resources :drugs #,except: :destroy
  resources :companies #, except: :destroy
  resources :distributors #, except: :destroy
  devise_for :users
  resources :users
  # get "/reports" => "reports#index" , as: :reports_index
  resources :reports , only: [] do
    collection do |c|
      match :generate , via: [:get, :post]
    end
  end
  root 'invoices#new'
  get "/drugs/:id/normalize_stock" => "drugs#normalize_stock"

  # get 'renew/:id' => 'orders#renew'
  # get 'return/:id' => 'orders#disable'
  # get 'past_orders' => 'orders#old'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
