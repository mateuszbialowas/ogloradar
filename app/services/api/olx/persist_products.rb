# frozen_string_literal: true

module Api
  module Olx
    class PersistProducts
      include BaseService

      def initialize(search:, uri: nil)
        @search = search
        @uri = uri || search.uri
      end

      def call
        parsed_products, next_page = (yield fetch_data).values_at(:parsed_products, :next_page)
        persist_products(parsed_products)

        next_page ? PersistProducts.new(search: @search, uri: next_page).call : Success()
      end

      private

      def fetch_data
        Api::Olx::FetchData.new(uri: @uri).call
      end

      def persist_products(products)
        products.each do |product|
          next if @search.products.exists?(external_id: product[:external_id])

          Product.create!(product.merge(search: @search))
        end
      end
    end
  end
end
