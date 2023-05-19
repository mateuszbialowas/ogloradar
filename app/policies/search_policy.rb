# frozen_string_literal: true

class SearchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user:)
    end
  end
end
