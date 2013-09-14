Tik::Application.routes.draw do

  resources :teams

  root 'tasks#index'

  resources :tasks, :users

end
