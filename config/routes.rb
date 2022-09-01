Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # Defines the root path route ("/")
  resources :spirits, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end

  resources :recommendations, only: :index
  resources :experiences, only: :create

  resources :orders, only: [:destroy, :show, :index] do
    resources :reviews
  end


  get "dashboard", to: "pages#dashboard"
  get "maindashboard", to: "pages#maindashboard"
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
end
