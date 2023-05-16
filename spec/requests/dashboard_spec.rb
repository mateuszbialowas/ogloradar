# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboards' do
  describe '#root' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }

      before { sign_in user }

      it 'renders the dashboard' do
        get '/'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Dashboard')
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign in page' do
        get '/'
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
