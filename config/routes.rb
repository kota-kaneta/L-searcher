Rails.application.routes.draw do
  devise_for :users
  root to: "schedules#index"
  resources :schedules
  resources :users, only: [:show] do
    collection do
      get 'search'
    end
  end
end
