# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsMailer do
  describe 'created' do
    subject(:mail) { described_class.created(user, Product.all) }

    let(:user) { create(:user) }
    let(:search) { create(:search, user:) }
    let!(:products) { create_list(:product, 3, search:) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Nowe ogłoszenia')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['no-reply@mateuszbialowas.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(products.first.title)
    end
  end
end
