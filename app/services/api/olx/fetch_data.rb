# frozen_string_literal: true

module Api
  module Olx
    class FetchData
      class OlxRequestError < StandardError; end
      include BaseService

      def initialize(uri:)
        @uri = uri
      end

      def call
        response = yield make_request
        parsed_body = Nokogiri::HTML(response.body)
        parsed_products = parse_products(parsed_body)
        next_page = next_page_uri(parsed_body)

        Success(parsed_products:, next_page:)
      end

      private

      def make_request
        response = HTTParty.get(@uri)
        response.code.eql?(200) ? Success(response) : raise(OlxRequestError, response)
      rescue StandardError => e
        Sentry.capture_exception(e)
        default_failure
      end

      def parse_products(body)
        listing_grid = body.css('div[data-testid="listing-grid"]').first
        products = listing_grid.css('div[data-cy="l-card"]')
        products.map do |product|
          parse_product(product)
        end
      end

      def next_page_uri(body)
        pagination = body.css('ul[data-testid="pagination-list"]').first
        next_page = pagination.css('a[data-cy="pagination-forward"]').first
        "https://www.olx.pl#{next_page['href']}" if next_page
      end

      def parse_product(product)
        {
          external_id: external_id(product),
          product_url: product_url(product),
          title: product_title(product),
          price: product_price(product),
          thumbnail_url: thumbnail_url(product),
          external_service_name: 'olx'
        }
      end

      def external_id(product)
        product.attributes['id'].value
      end

      def product_url(product)
        href = product.css('a').first['href']
        return href if href.start_with?('http')

        "https://www.olx.pl#{href}"
      end

      def product_title(product)
        product.css('h6').first.text
      end

      def product_price(product)
        product.css('p[data-testid="ad-price"]').first.text
      end

      def thumbnail_url(product)
        product.css('img').first['src'] || 'https://placehold.co/400'
      end
    end
  end
end
