# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/searches' do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      name: 'MyString',
      uri: 'www.example.com',
      status: 'inactive',
      user:
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      uri: nil,
      status: nil
    }
  end

  before { sign_in user }

  describe 'GET /index' do
    it 'renders a successful response' do
      Search.create! valid_attributes
      get searches_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      search = Search.create! valid_attributes
      get search_url(search)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_search_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      search = Search.create! valid_attributes
      get edit_search_url(search)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Search' do
        expect do
          post searches_url, params: { search: valid_attributes }
        end.to change(Search, :count).by(1)
      end

      it 'redirects to the created search' do
        post searches_url, params: { search: valid_attributes }
        expect(response).to redirect_to(search_url(Search.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Search' do
        expect do
          post searches_url, params: { search: invalid_attributes }
        end.not_to change(Search, :count)
      end

      it "renders a new template" do
        post searches_url, params: { search: invalid_attributes }
        expect(response).to render_template('searches/new')
        expect(response.body).to include('Nie udało się utworzyć wyszukiwania. Popraw dane w formularzu.')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'New name'
        }
      end

      it 'updates the requested search' do
        search = Search.create! valid_attributes
        patch search_url(search), params: { search: new_attributes }
        search.reload
        expect(search.name).to eq('New name')
      end

      it 'redirects to the search' do
        search = Search.create! valid_attributes
        patch search_url(search), params: { search: new_attributes }
        search.reload
        expect(response).to redirect_to(search_url(search))
      end
    end

    context 'with invalid parameters' do
      it 'renders edit template' do
        search = Search.create! valid_attributes
        patch search_url(search), params: { search: invalid_attributes }
        expect(response).to render_template('searches/edit')
        expect(response.body).to include('Nie udało się zaktualizować wyszukiwania. Popraw dane w formularzu.')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested search' do
      search = Search.create! valid_attributes
      expect do
        delete search_url(search)
      end.to change(Search, :count).by(-1)
    end

    it 'redirects to the searches list' do
      search = Search.create! valid_attributes
      delete search_url(search)
      expect(response).to redirect_to(searches_url)
    end
  end
end
