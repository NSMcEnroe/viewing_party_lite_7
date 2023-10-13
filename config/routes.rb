# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'

  get '/register', to: 'users#new', as: :register
  resources :users, only: [:index, :new, :show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:show]
    end
  end
end


