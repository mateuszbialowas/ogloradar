# frozen_string_literal: true

module Api
  module Olx
    class FetchData
      class OlxResponseError < StandardError; end
      include BaseService

      def initialize(url:)
        @url = url
      end

      def call
        response = yield make_request
        parsed_body = Nokogiri::HTML(response.body)
        parsed_offers = parse_offers(parsed_body)
        next_page = next_page_url(parsed_body)

        Success(parsed_offers:, next_page:)
      end

      private

      def make_request
        response = HTTParty.get(@url)
        response.code.eql?(200) ? Success(response) : raise(OlxResponseError, response)
      rescue StandardError => e
        Sentry.capture_exception(e)
        default_failure
      end

      def parse_offers(body)
        listing_grid = body.css('div[data-testid="listing-grid"]').first
        offers = listing_grid.css('div[data-cy="l-card"]')
        offers.map do |offer|
          parse_offer(offer)
        end
      end

      def next_page_url(body)
        pagination = body.css('ul[data-testid="pagination-list"]').first
        next_page = pagination.css('a[data-cy="pagination-forward"]').first
        "https://www.olx.pl#{next_page['href']}" if next_page
      end

      def parse_offer(offer)
        {
          id: offer_id(offer),
          href: offer_href(offer),
          title: offer_title(offer),
          price: offer_price(offer),
          thumbnail: offer_thumbnail(offer),
          location: offer_location(offer),
          date: offer_date(offer),
          area: offer_area(offer)
        }
      end

      def offer_id(offer)
        offer.attributes['id'].value
      end

      def offer_href(offer)
        offer.css('a').first['href']
      end

      def offer_title(offer)
        offer.css('h6').first.text
      end

      def offer_price(offer)
        offer.css('p[data-testid="ad-price"]').first.text
      end

      def offer_thumbnail(offer)
        offer.css('img').first['src']
      end

      def offer_location(offer)
        offer.css('p[data-testid="location-date"]').first.text.split('-').first.strip
      end

      def offer_date(offer)
        offer.css('p[data-testid="location-date"]').first.text.split('-').last.strip
      end

      def offer_area(offer)
        offer.css('span.css-643j0o').first.text
      end
    end
  end
end
