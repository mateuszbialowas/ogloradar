# frozen_string_literal: true

require 'rails_helper'

describe Api::Olx::FetchData do
  subject(:service) { described_class.new(uri:).call }

  let(:uri) { 'https://www.olx.pl/nieruchomosci/mieszkania/bialystok/?search%5Border%5D=created_at:desc&search%5Bfilter_float_price:from%5D=1500&search%5Bfilter_float_price:to%5D=4000' }

  context 'with success' do
    it 'returns success', vcr: 'olx/success_fetched_data' do
      expect(service).to be_a(Success)
    end

    it 'returns data in hash', vcr: 'olx/success_fetched_data' do
      expect(service.success).to be_a(Hash)
    end

    it 'returns parsed offers and next_page', vcr: 'olx/success_fetched_data' do
      expect(service.success[:parsed_products].first.keys).to contain_exactly(
        :external_id, :product_url, :title, :price,
        :thumbnail_url, :external_service_name
      )
      expect(service.success[:next_page]).to be_a(String)
    end
  end

  context 'with failure' do
    context 'when request fails' do
      let(:uri) { 'https://www.bad_request.com' }

      it 'raise error', vcr: 'olx/failure_fetched_data' do
        expect { service }.to raise_error(SocketError)
      end
    end

    context 'when response code is not 200' do
      let(:response) { instance_double(HTTParty::Response, code: 500) }

      before do
        allow(HTTParty).to receive(:get).and_return(response)
      end

      it 'returns failure', vcr: 'olx/failure_fetched_data' do
        expect { service }.to raise_error(Api::Olx::FetchData::OlxRequestError)
      end
    end
  end
end
