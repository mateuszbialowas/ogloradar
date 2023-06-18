# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:search).where(searches: { user_id: user.id })
    end
  end
end
