Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'users#index'
    get '/users/sign_out' => 'devise/sessions#destroy'
  resources :users, only: [:index]
  end
  resources :categories
end
