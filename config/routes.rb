Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Defines the root path route ("/")
  resources :spirits, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:destroy, :show, :index] do
    resources :reviews
  end

  get "dashboard", to: "pages#dashboard"
end
