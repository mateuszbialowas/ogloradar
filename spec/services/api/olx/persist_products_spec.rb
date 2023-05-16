# frozen_string_literal: true

require 'rails_helper'

describe Api::Olx::PersistProducts do
  subject(:service) { described_class.new(uri:).call }

  let(:uri) { 'https://www.olx.pl/nieruchomosci/mieszkania/wynajem/bialystok/?search%5Bfilter_float_price:from%5D=2000&search%5Bfilter_float_price:to%5D=4000&search%5Bfilter_enum_furniture%5D%5B0%5D=yes&search%5Bfilter_enum_rooms%5D%5B0%5D=two&search%5Bfilter_enum_rooms%5D%5B1%5D=three' }

  context 'with success' do
    it 'creates products', vcr: 'Api::Olx::PersistProducts' do
      expect { service }.to change(Product, :count).by(161)
    end

    it 'fetch products from next pages', vcr: 'Api::Olx::PersistProducts' do
      allow(Api::Olx::FetchData).to receive(:new).and_call_original

      service

      expect(Api::Olx::FetchData).to have_received(:new).exactly(5).times
    end
  end
end
