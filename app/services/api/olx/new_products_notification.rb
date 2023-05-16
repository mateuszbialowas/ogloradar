# frozen_string_literal: true

module Api
  module Olx
    class NewProductsNotification
      include BaseService

      def initialize(uri:, current_user:)
        @uri = uri
        @current_user = current_user
      end

      def call
        timestamp = Time.zone.now
        Api::Olx::PersistProducts.new(uri: @uri).call
        new_products = Product.where('created_at > ?', timestamp)

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
