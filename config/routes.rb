Rails.application.routes.draw do
  root to: 'ressources#index'
  get 'ressources/index'
end
