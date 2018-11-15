Rails.application.routes.draw do
  get '/coins/value', to: "coins#value"
  resources :coins, except: [:new, :edit]
  resources :transactions, only: [:index]
  resources :deposits, controller: 'transactions', only: [:create], action: "make_deposit"
  resources :withdraws, controller: 'transactions', only: [:create], action: "make_withdrawl"
  resources :users do
  	resources :transactions, only: [:index], action: "user_transactions"
  end
end
