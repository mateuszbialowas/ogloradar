# frozen_string_literal: true

require 'rails_helper'

describe Searches::Update do
  subject(:service) { described_class.new(current_user:, params:, search_id: params[:id]).call }

  let(:current_user) { create(:user) }
  let(:search) { create(:search, user: current_user, name: 'Name') }
  let(:name) { 'New name' }

  let(:params) do
    {
      name:,
      uri: search.uri,
      status: search.status,
      id: search.id
    }
  end

  context 'with success' do
    it 'returns success and search object' do
      expect(service).to be_a(Success)
      expect(service.success[:search]).to be_a(Search)
    end

    it 'updates Search model' do
      expect { service }.to change { search.reload.name }.to(name)
    end
  end

  context 'with failure' do
    let(:name) { '' }

    it 'returns failure and error message' do
      expect(service).to be_a(Failure)
      expect(service.failure[:message]).to eq('Nie udało się zaktualizować wyszukiwania. Popraw dane w formularzu.')
    end

    it 'does not update Search model' do
      expect { service }.not_to change(search, :name)
    end
  end
end
