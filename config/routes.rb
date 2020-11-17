Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root to: 'pages#home'
  resources :secured_items, only: [:new, :create, :edit, :update] do
    resources :item_designs, only: [:show, :index]
  end
end
