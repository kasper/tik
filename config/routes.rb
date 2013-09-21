Tik::Application.routes.draw do

  root 'tasks#index'

  resources :users, :teams, :tasks

  # Sessions

  resources :sessions, :only => [ :new, :create, :destroy ]

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  # Users

  get 'signup' => 'users#new'

  # Tags

  resources :tags, :only => [ :index, :show, :destroy ]

end
