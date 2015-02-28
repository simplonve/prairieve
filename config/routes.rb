Rails.application.routes.draw do
  root to: 'chapitres#index'

  get '/welcome', to: 'static#welcome'
  get '/stat', to: 'static#stat'

  resource :sessions, only: [:create, :destroy]
  resources :users, only: [:edit, :update, :show]
  resource :reset_password

  resources :chapitres do
    resources :ressources
  end
end
