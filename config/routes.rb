# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show] do
    resources :posts, only: %i[new create]
    resources :follows, only: %i[create destroy]
    resources :bookmarks, only: %i[index create destroy]
    resources :direct_message_rooms, only: %i[index create show] do
      resources :direct_messages, only: %i[create]
    end
  end
  resources :posts, only: [:show] do
    resource :likes, only: %i[create destroy]
    resource :reposts, only: %i[create destroy]
  end
  root 'home#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
