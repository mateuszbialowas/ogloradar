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

      def make_next_request?(fetch_data_result)
        return false unless fetch_data_result[:next_page]

        !Product.exists?(external_id: fetch_data_result[:parsed_products].last[:external_id])
      end

      def persist_products(products)
        products.each do |product|
          next if Product.exists?(external_id: product[:external_id])

          Product.create(product.except(:advertised, :date, :location, :area).merge(search: @search))
        end
      end
    end
  end
end
