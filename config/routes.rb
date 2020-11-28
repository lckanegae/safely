Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :item_designs, only: [:show, :index]
  resources :secured_items, only: [:new, :edit, :create, :update]
  get 'search', to: 'item_designs#index', as: :search
  get 'profile', to: 'pages#profile'
  patch 'secured_items/:id/activate', to: 'secured_items#activate', as: :activate
  patch 'secured_items/:id/deactivate', to: 'secured_items#deactivate', as: :deactivate
end
