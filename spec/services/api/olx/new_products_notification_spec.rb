# frozen_string_literal: true

require 'rails_helper'

describe Api::Olx::NewProductsNotification do
  subject(:service) { described_class.new(search:, current_user: user).call }

  let(:user) { create(:user) }
  let(:search) { create(:search, user:) }

  before do
    allow(Api::Olx::PersistProducts).to receive(:new).and_return(
      instance_double(Api::Olx::PersistProducts, call: Success())
    )
  end

  context 'without new products' do
    before { allow(search.products).to receive(:where).and_return(Product.none) }

    it 'returns success' do
      expect(service).to be_a(Success)
    end

    it 'not sends email' do
      service
      expect(ActionMailer::Base.deliveries.count).to eq(0)
    end
  end

  context 'with new products' do
    let(:products) { create_list(:product, 2, search:) }

    before do
      products
      allow(search.products).to receive(:where).and_return(Product.all)
    end

    it 'sends email' do
      service
      expect(ActionMailer::Base.deliveries.count).to eq(1)
      mail = ActionMailer::Base.deliveries.last
      expect(mail.to).to eq([user.email])
      expect(mail.subject).to eq('Nowe ogłoszenia')
    end
  end
end
