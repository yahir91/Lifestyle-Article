# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, only: [:show]
  resources :users
  resources :articles do
    resources :votes, only: %i[create destroy]
  end
  resources :sessions, only: %i[create destroy]

  root to: 'articles#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
