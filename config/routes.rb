Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  get "/faq", to: "static_pages#faq"
  resources :charges
  resources :boosts, only: [:new, :create]
  resources :users, only: [:show] do
    resources :riot_accounts
  end
  namespace :admin do
    root to: "static_pages#index" 
    resources :users, only: [:edit, :update, :show, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
