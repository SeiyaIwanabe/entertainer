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
    collection do
      post :confirm, to: 'events#confirm'
    end
    resources :entries, only: [:create]
  end
end
