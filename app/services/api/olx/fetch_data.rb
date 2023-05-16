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
        parsed_products = products.map do |product|
          parse_product(product)
        end
        parsed_products.select { |product| product[:advertised] == false }
      end

      def next_page_uri(body)
        pagination = body.css('ul[data-testid="pagination-list"]').first
        next_page = pagination.css('a[data-cy="pagination-forward"]').first
        "https://www.olx.pl#{next_page['href']}" if next_page
      end

      def parse_product(product) # rubocop:disable Metrics/MethodLength
        {
          external_id: external_id(product),
          product_url: product_url(product),
          title: product_title(product),
          price: product_price(product),
          thumbnail_url: thumbnail_url(product),
          external_service_name: 'olx',
          advertised: product_advertised?(product),
          location: product_location(product),
          date: product_date(product),
          area: product_area(product)
        }
      end

      def external_id(product)
        product.attributes['id'].value
      end

      def product_url(product)
        "https://www.olx.pl#{product.css('a').first['href']}"
      end

      def product_title(product)
        product.css('h6').first.text
      end

      def product_price(product)
        product.css('p[data-testid="ad-price"]').first.text
      end

      def thumbnail_url(product)
        "https://www.olx.pl#{product.css('img').first['src']}"
      end

      def product_advertised?(product)
        product.css('div[data-testid="adCard-featured"]').first&.text.eql?('Wyróżnione') || false
      end

      def product_location(product)
        product.css('p[data-testid="location-date"]').first.text.split('-').first.strip
      end

      def product_date(product)
        product.css('p[data-testid="location-date"]').first.text.split('-').last.strip
      end

      def product_area(product)
        product.css('span.css-643j0o').first.text
      end
    end
  end
end
