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
        init_config = body.css('script#olx-init-config').first.text
        prerendered_state = init_config[/window\.__PRERENDERED_STATE__= (.*);/, 1]
        parsed_data = JSON.parse(JSON.parse(prerendered_state))
        products = parsed_data['listing']['listing']['ads']
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
          external_id: product['id'],
          product_url: product['url'],
          title: product['title'],
          price: product['price']['displayValue'],
          thumbnail_url: product['photos'].first,
          external_service_name: 'olx'
        }
      end
    end
  end
end
