# frozen_string_literal: true

module Searches
  class ProductFetch
    include BaseService
    attr_reader :current_user

    def initialize(current_user:, search_id:)
      @current_user = current_user
      @search_id = search_id
    end

    def call
      search = yield find_search
      fetch_products(search)

      Success()
    end

    private

    def find_search
      Success(policy_scope(Search).find(@search_id))
    rescue ActiveRecord::RecordNotFound
      Failure(message: 'Nie znaleziono wyszukiwania.')
    end

    def fetch_products(search)
      Api::Olx::NewProductsNotificationJob.perform_async(search.id)
    end
  end
end
