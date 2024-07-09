# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show] do
    resources :posts, only: %i[new create]
  end
  resources :posts, only: [:show] do
    resource :likes, only: %i[create destroy]
    resource :reposts, only: %i[create destroy]
  end
  root 'home#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
