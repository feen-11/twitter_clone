# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "home#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
