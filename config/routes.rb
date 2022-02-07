Rails.application.routes.draw do
  resources :trans
  devise_for :users
  devise_scope :user do
    root 'users#index'
  resources :users, only: [:index]
  end
  resources :categories
end
