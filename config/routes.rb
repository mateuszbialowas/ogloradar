# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
    mount PgHero::Engine, at: 'pghero'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'dashboard#index'

  authenticated :user do
    resources :searches do
      resources :products, only: %i[index]
    end
  end
end
