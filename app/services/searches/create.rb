# frozen_string_literal: true

module Searches
  class Create
    include BaseService

    attr_reader :current_user

    def initialize(current_user:, params:)
      @current_user = current_user
      @params = params
    end

    def call
      search = build_search
      yield validate_search(search)
      yield save_search(search)

      Success(search:)
    end

    private

    def build_search
      @current_user.searches.build(@params)
    end

    def validate_search(search)
      if search.valid?
        Success()
      else
        Failure(message: 'Nie udało się utworzyć wyszukiwania. Popraw dane w formularzu.',
                search:)
      end
    end

    def save_search(search)
      if search.save
        Success()
      else
        Failure(message: 'Nie udało się utworzyć wyszukiwania. Spróbuj ponownie później.',
                search:)
      end
    end
  end
end
