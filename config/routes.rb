Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update]
  resources :events, only: [:index, :show, :new, :create] do
    resource :favorites, only: [:create, :destroy]
    resources :entries, only: [:create]
    collection do
      get :search, to: 'events#search'
      # post :tagging, to: 'events#tagging'
      post :confirm, to: 'events#confirm'
    end
  end
end
