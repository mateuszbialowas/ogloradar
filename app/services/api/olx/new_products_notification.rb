# frozen_string_literal: true

module Api
  module Olx
    class NewProductsNotification
      include BaseService

      def initialize(search:, current_user:)
        @search = search
        @current_user = current_user
      end

      def call
        timestamp = Time.zone.now
        yield Api::Olx::PersistProducts.new(search: @search).call

        new_products = @search.products.where('created_at > ?', timestamp)

        return Success() if new_products.empty?

        send_mail(new_products)
        Success()
      end

      private

      def send_mail(new_products)
        ProductsMailer.created(@current_user, new_products).deliver_now
      end
    end
  end
end
