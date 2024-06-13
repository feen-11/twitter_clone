# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'home#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
