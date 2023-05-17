# frozen_string_literal: true

class SearchPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:)
    end
  end
end
