# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users', controllers: {
        registrations: 'api/v1/users',
        confirmations: 'api/v1/confirmations'
      }
      resources :tweets, only: %i[index create]
      resources :images, only: %i[create]
      namespace :auth do
        resources :sessions, only: [:index]
      end
    end
  end

  root 'home#index'
  # resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
