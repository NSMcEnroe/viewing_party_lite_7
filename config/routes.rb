# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'

  get '/register', to: 'users#new', as: :register
  resources :users, only: [:index, :new, :show, :create] do
    get "/discover" => 'user_discover#index', as: :discover
    resources :movies, only: [:index] do
      resources :viewing_parties, only: [:show]
    end
  end
end


