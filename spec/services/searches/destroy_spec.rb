# frozen_string_literal: true

require 'rails_helper'

describe Searches::Destroy do
  subject(:service) { described_class.new(current_user:, search_id:).call }

  let(:current_user) { create(:user) }
  let(:search) { create(:search, user: current_user) }
  let(:search_id) { search.id }

  context 'with success' do
    it 'returns success' do
      expect(service).to be_a(Success)
    end

    it 'destroys search' do
      expect { service }.to change(Search, :count).by(-1)
    end
  end

  context 'with failure' do
    context 'when search does not exist' do
      let(:search_id) { 0 }

      it 'returns failure' do
        expect(service).to be_a(Failure)
        expect(service.failure[:message]).to eq('Nie znaleziono wyszukiwania.')
      end

      it 'does not destroy search' do
        expect { service }.not_to change(Search, :count)
      end
    end
  end
end
