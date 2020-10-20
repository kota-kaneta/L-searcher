Rails.application.routes.draw do
  devise_for :users
  root to: "schedules#index"
  resources :schedules
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
end
