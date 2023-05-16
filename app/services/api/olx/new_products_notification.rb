# frozen_string_literal: true

module Api
  module Olx
    class NewProductsNotification
      include BaseService

      def initialize(uri:)
        @uri = uri
      end

      def call
        timestamp = Time.zone.now
        Api::Olx::PersistProducts.new(uri: @uri).call
        new_products = Product.where('created_at > ?', timestamp)

        return Success() if new_products.empty?

        send_mail(new_products)
      end

      private

      def send_mail(new_products)
        user = User.find_by(email: 'mateusz.bialowas2@gmail.com')
        ProductsMailer.created(user, new_products).deliver_now
      end
    end
  end
end
