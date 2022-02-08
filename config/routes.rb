Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'categories#index'
    get '/users/sign_out' => 'devise/sessions#destroy'
  resources :users, only: [:index]
  end
  resources :categories
end
