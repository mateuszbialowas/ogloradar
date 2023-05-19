# frozen_string_literal: true

class SearchPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user:)
    end
  end
end
