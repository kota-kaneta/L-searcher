Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "schedules#index"
  resources :schedules do
    collection do
      get 'how_to'
    end
  end
  resources :rooms, only: [:create, :show, :index] do
    member do
      get 'room_list'
    end
  end
  resources :messages, only: [:create]
  resources :notifications, only: [:index]
  resources :users, only: [:show] do
    collection do
      get 'search'
      get 'time_line'
    end
    member do
      get 'match'
    end
  end
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'

  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list' 

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/guest_two_sign_in', to: 'users/sessions#new_guest_two'
  end
end
