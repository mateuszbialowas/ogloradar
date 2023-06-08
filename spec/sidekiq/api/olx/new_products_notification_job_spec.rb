# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::Olx::NewProductsNotificationJob, type: :job do
  subject(:job) { described_class.perform_later(search.id) }

  let(:search) { create(:search) }

  it 'does not retry the job' do
    expect(described_class).to be_retryable false
  end

  it 'enqueues the job in the default queue' do
    expect(described_class).to be_processed_in :default
  end
end
