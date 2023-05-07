# frozen_string_literal: true

require 'rails_helper'

describe User do
  let(:user) { create(:user) }

  context 'with success' do
    it 'succeeds' do
      expect(user).to be_valid
    end
  end
end
