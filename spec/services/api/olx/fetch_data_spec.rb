# frozen_string_literal: true

require 'rails_helper'

describe Api::Olx::FetchData do
  subject(:service) { described_class.new(uri:).call }

  let(:uri) { 'https://www.olx.pl/nieruchomosci/mieszkania/bialystok/?search%5Border%5D=created_at:desc&search%5Bfilter_float_price:from%5D=1500&search%5Bfilter_float_price:to%5D=4000' }

  context 'with success' do
    it 'returns success', vcr: 'olx fetched data' do
      expect(service).to be_a(Success)
    end

    it 'returns data in hash', vcr: 'olx fetched data' do
      expect(service.success).to be_a(Hash)
    end

    it 'returns parsed offers and next_page', vcr: 'olx fetched data' do
      expect(service.success[:parsed_products].first.keys).to contain_exactly(
        :external_id, :product_url, :area, :title, :price,
        :thumbnail_url, :date, :external_service_name, :advertised, :location
      )
      expect(service.success[:next_page]).to be_a(String)
    end
  end

  context 'when http request fails and raises exception' do
    it 'returns failure and sends message to Sentry', vcr: 'failed olx fetched data' do
      allow(HTTParty).to receive(:get).and_raise(StandardError)
      allow(Sentry).to receive(:capture_exception)
      expect(service).to be_a(Failure)
      expect(service.failure).to eq('Coś poszło nie tak. Skontaktuj się z administratorem')
    end
  end
end
