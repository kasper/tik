Tik::Application.routes.draw do

  root 'tasks#index'

  resources :tasks, :users

end
