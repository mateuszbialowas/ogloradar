# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OlxApiSchedulerJob, type: :job do
  subject(:job) { described_class.new.perform }

  let(:search) { create(:search) }
  let(:service) { instance_double(Api::Olx::NewProductsNotification, call: '') }
  let(:active_searches) { [] }

  before do
    allow(Search).to receive(:active).and_return(active_searches)
    allow(Api::Olx::NewProductsNotification).to receive(:new).and_return(service)
  end

  describe 'sidekiq_options' do
    it 'does not retry the job' do
      expect(described_class).to be_retryable false
    end

    it 'enqueues the job in the default queue' do
      expect(described_class).to be_processed_in :default
    end
  end

  describe '#perform' do
    context 'when there are no active searches' do
      let(:active_searches) { [] }

      it 'does not call the service' do
        job
        expect(Api::Olx::NewProductsNotification).not_to have_received(:new)
      end
    end

    context 'when there are active searches' do
      let(:active_searches) { [search] }

      it 'calls the service for each active search' do
        described_class.new.perform
        expect(Api::Olx::NewProductsNotification).to have_received(:new).with(search:).once
        expect(service).to have_received(:call).once
      end
    end

    context 'when the service raises an error' do
      let(:active_searches) { [search] }

      before do
        allow(service).to receive(:call).and_raise(StandardError)
      end

      it 'does not retry the job' do
        expect { job }.to raise_error(StandardError)
        expect(described_class).not_to have_enqueued_sidekiq_job
      end
    end
  end
end
