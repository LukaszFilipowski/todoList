Rails.application.routes.draw do

  resources :notes
  resources :sessions, only: [:new, :create, :destroy]

  get 'singup', to: 'users#new', as: 'singup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  get 'page/index'
  root 'page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
