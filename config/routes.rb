Rails.application.routes.draw do
  root to: 'chapitres#index'
  get 'chapitres/index'
end
