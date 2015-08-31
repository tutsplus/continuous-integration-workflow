Rails.application.routes.draw do
  resources :books, except: [:show]
  resources :authors, except: [:show]
  resources :publishers, except: [:show]

  root to: 'dashboard#index'
end
