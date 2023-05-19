# frozen_string_literal: true

module Searches
  class Destroy
    include BaseService
    attr_reader :current_user

    def initialize(current_user:, search_id:)
      @current_user = current_user
      @search_id = search_id
    end

    def call
      search = yield find_search
      yield destroy_search(search)

      Success()
    end

    private

    def find_search
      Success(policy_scope(Search).find(@search_id))
    rescue ActiveRecord::RecordNotFound
      Failure(message: 'Nie znaleziono wyszukiwania.')
    end

    def destroy_search(search)
      if search.destroy
        Success()
      else
        Failure(message: 'Nie udalo sie usunac wyszukiwania.')
      end
    end
  end
end
