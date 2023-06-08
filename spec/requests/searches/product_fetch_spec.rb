# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProductFetches' do
  let(:user) { create(:user) }
  let(:search) { create(:search, user:) }

  before { sign_in user }

  describe 'POST /create' do
    let(:post_request) { post "/searches/#{search.id}/product_fetch", as: :turbo_stream }

    it 'enqueues a job' do
      expect { post_request }.to change { Api::Olx::NewProductsNotificationJob.jobs.size }.by(1)
    end

    it 'returns a success response' do
      post_request
      expect(response.body).to include('Wyszukiwanie rozpoczęte. Powiadomimy Cię o nowych ogłoszeniach.')
    end
  end
end
