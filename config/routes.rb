Rails.application.routes.draw do
  root to: 'chapitres#index'
  resources :chapitres
end
