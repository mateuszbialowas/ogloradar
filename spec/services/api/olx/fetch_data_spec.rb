# frozen_string_literal: true

require 'rails_helper'

describe Api::Olx::FetchData do
  subject(:service) { described_class.new(url:).call }

  let(:url) { 'https://www.olx.pl/nieruchomosci/mieszkania/bialystok/?search%5Border%5D=created_at:desc&search%5Bfilter_float_price:from%5D=1500&search%5Bfilter_float_price:to%5D=4000' }

  context 'with success' do
    it 'returns success', vcr: 'olx fetched data' do
      expect(service).to be_a(Success)
    end

    it 'returns parsed offers and next_page', vcr: 'olx fetched data' do
      expect(service.success).to be_a(Hash)
      expect(service.success[:parsed_offers].first.keys).to contain_exactly(:id, :href, :title, :price, :thumbnail,
                                                                            :location, :date, :area)
      expect(service.success[:next_page]).to be_a(String)
    end
  end
end
