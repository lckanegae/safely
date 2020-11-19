Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
  resources :item_designs, only: [:show, :index]
  resources :secured_items, only: [:new, :create, :edit, :update]
  get 'search', to: 'item_designs#index', as: :search
  get 'profile', to: 'pages#profile'
end
