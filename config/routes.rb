Rails.application.routes.draw do
  root to: 'chapitres#index'

  get '/welcome', to: 'chapitres#welcome'

  resource :sessions, only: [:create, :destroy]
  resources :users, only: [:edit, :update, :show]
  resource :reset_password

  resources :chapitres
end
