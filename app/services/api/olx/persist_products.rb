# frozen_string_literal: true

module Api
  module Olx
    class PersistProducts
      include BaseService

      def initialize(uri:)
        @uri = uri
      end

      def call
        fetch_data_result = yield fetch_data
        yield persist_products(fetch_data_result[:parsed_products])
        next_page = fetch_data_result[:next_page]

        next_page ? PersistProducts.new(uri: next_page).call : Success()
      end

      private

      def fetch_data
        Api::Olx::FetchData.new(uri: @uri).call
      end

      def persist_products(products)
        products.each do |product|
          next if Product.exists?(external_id: product[:external_id])

          Product.create(product)
        end
        Success()
      end
    end
  end
end
