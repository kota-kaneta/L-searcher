Rails.application.routes.draw do
  devise_for :users
  root to: "schedules#index"
  resources :schedules
  resources :users, only: [:edit, :new, :create]
end
