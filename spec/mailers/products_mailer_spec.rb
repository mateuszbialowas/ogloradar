# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsMailer do
  describe 'created' do
    subject(:mail) { described_class.created(user, products) }

    let(:user) { create(:user) }
    let(:products) { create_list(:product, 3) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Nowe ogłoszenia')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['mateusz.bialowas+ogloradar-stg2@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(products.first.title)
    end
  end
end
