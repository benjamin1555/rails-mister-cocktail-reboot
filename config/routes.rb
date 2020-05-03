Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails, only: [:show, :new, :create]
end
