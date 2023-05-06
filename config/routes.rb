# frozen_string_literal: true

Rails.application.routes.draw do
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'pages#home'
end
