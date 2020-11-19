Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :item_designs, only: [:show, :index]
  resources :secured_items, only: [:new, :create, :edit, :update]
  get 'search', to: 'item_designs#index', as: :search
end
