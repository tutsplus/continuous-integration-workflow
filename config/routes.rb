Rails.application.routes.draw do
  resources :books, except: [:show]
  resources :authors, only: [:index]
  resources :publishers, only: [:index]

  root to: 'dashboard#index'
end
