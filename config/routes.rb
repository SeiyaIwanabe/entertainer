Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'

  resources :events, only: :index
  resources :users, only: [:show, :edit, :update]
end
