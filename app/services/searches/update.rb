# frozen_string_literal: true

module Searches
  class Update
    include BaseService
    attr_reader :current_user

    def initialize(current_user:, params:, search_id:)
      @current_user = current_user
      @params = params
      @search_id = search_id
    end

    def call
      search = yield find_search
      yield update_search(search)

      Success(search:)
    end

    private

    def find_search
      Success(policy_scope(Search).find(@search_id))
    rescue ActiveRecord::RecordNotFound
      Failure(message: 'Nie znaleziono wyszukiwania.', search: Search.new)
    end

    def update_search(search)
      if search.update(@params)
        Success()
      else
        Failure(message: 'Nie udało się zaktualizować wyszukiwania. Popraw dane w formularzu.',
                search:)
      end
    end
  end
end
