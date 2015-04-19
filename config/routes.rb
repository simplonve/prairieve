Rails.application.routes.draw do
  root to: 'static#welcome'

  get '/welcome', to: 'static#welcome'
  get '/monitor', to: 'static#monitor'
  patch '/assign', to: 'static#assign'
  post '/validation', to: 'static#validation'
  get '/stat', to: 'static#stat'

  resource :sessions, only: [:create, :destroy]
  resources :users, only: [:edit, :update, :show]
  resource :reset_password
  resource :activites

  resources :chapitres do
    resources :ressources
  end
end
