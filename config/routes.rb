# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'dashboard#index'

  authenticated :user do
    resources :searches
  end
end
