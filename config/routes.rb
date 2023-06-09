# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount PgHero::Engine, at: 'pghero'
  end
  mount Lookbook::Engine, at: '/lookbook'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'dashboard#index'

  authenticated :user do
    resources :searches do
      resources :products, only: %i[index]
      post :product_fetch, to: 'searches/product_fetch#create'
    end
  end
end
