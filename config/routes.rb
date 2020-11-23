Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :item_designs, only: [:show]
  resources :secured_items, only: [:new, :create, :update]
  get 'search', to: 'item_designs#index', as: :search
  get 'profile', to: 'pages#profile'
end
