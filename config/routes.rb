Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'search', to: 'item_designs#index', as: :search
  resources :profile, only: [:edit, :update]
  resources :secured_items, only: [:new, :create, :edit, :update] do
    resources :item_designs, only: [:show, :index]
  end
end
