# frozen_string_literal: true

module Api
  module Olx
    class NewProductsNotificationJob
      include Sidekiq::Job
      sidekiq_options retry: false

      def perform(search_id)
        search = Search.find(search_id)
        Api::Olx::NewProductsNotification.new(search:).call
      end
    end
  end
end
