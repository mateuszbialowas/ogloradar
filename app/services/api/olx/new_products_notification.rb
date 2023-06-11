# frozen_string_literal: true

module Api
  module Olx
    class NewProductsNotification
      include BaseService

      def initialize(search:)
        @search = search
      end

      def call
        timestamp = Time.zone.now
        yield Api::Olx::PersistProducts.new(search: @search).call

        new_products = @search.products.where('created_at > ?', timestamp)

        send_mail(new_products)
        Success()
      end

      private

      def send_mail(new_products)
        ProductsMailer.notify_with_products(@search.user, new_products).deliver_now
      end
    end
  end
end
