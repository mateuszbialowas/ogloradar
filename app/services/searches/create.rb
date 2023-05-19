# frozen_string_literal: true

module Searches
  class Create
    include BaseService

    def initialize(current_user:, params:)
      @current_user = current_user
      @params = params
    end

    def call
      search = build_search
      yield authorize(search)
      yield validate_search(search)
      yield save_search(search)

      Success(search:)
    end

    private

    def build_search
      @current_user.searches.build(@params)
    end

    def authorize(search)
      Pundit.authorize(@current_user, search, :create?)
      Success()
    rescue Pundit::NotAuthorizedError
      Failure(message: 'Nie masz uprawnień do utworzenia wyszukiwania.',
              search:)
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
