Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :icon, to: 'users#icon'
    end
  end

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :entries, only: [:create]
    resource :favorites, only: [:create, :destroy]
    collection do
      get :search, to: 'events#search'
      post :confirm, to: 'events#confirm'
    end
  end
end
