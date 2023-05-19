# frozen_string_literal: true

require 'rails_helper'

describe Searches::Create do
  subject(:service) { described_class.new(current_user:, params:).call }

  let(:current_user) { create(:user) }
  let(:params) do
    {
      name:,
      uri:,
      status:
    }
  end

  let(:status) { 'inactive' }
  let(:uri) { 'https://example.com' }
  let(:name) { 'Test search' }

  context 'with success' do
    it 'returns success and search object' do
      expect(service).to be_a(Success)
      expect(service.success[:search]).to be_a(Search)
    end

    it 'creates Search model' do
      expect { service }.to change(Search, :count).by(1)
      expect(Search.last).to have_attributes(
        name:, uri:, status:, user: current_user
      )
    end
  end

  context 'with failure' do
    context 'when user is not authorized' do
      before { allow(Pundit).to receive(:authorize).and_raise(Pundit::NotAuthorizedError) }

      it 'returns failure and error message' do
        expect(service).to be_a(Failure)
        expect(service.failure[:message]).to eq('Nie masz uprawnień do utworzenia wyszukiwania.')
        expect(Pundit).to have_received(:authorize).with(current_user, Search, :create?)
      end

      it 'does not create Search model' do
        expect { service }.not_to change(Search, :count)
      end
    end

    context 'when search is invalid' do
      let(:name) { '' }

      it 'returns failure and error message' do
        expect(service).to be_a(Failure)
        expect(service.failure[:message]).to eq('Nie udało się utworzyć wyszukiwania. Popraw dane w formularzu.')
      end

      it 'does not create Search model' do
        expect { service }.not_to change(Search, :count)
      end
    end

    context 'when search cannot be saved' do
      before do
        search = build(:search)
        allow(current_user.searches).to receive(:build).and_return(search)
        allow(search).to receive(:save).and_return(false)
      end

      it 'returns failure and error message' do
        expect(service).to be_a(Failure)
        expect(service.failure[:message]).to eq('Nie udało się utworzyć wyszukiwania. Spróbuj ponownie później.')
      end

      it 'does not create Search model' do
        expect { service }.not_to change(Search, :count)
      end
    end
  end
end
