# frozen_string_literal: true

module Searches
  class StatusComponentPreview < ViewComponent::Preview
    # @!group Statuses
    def wrong
      render(Searches::StatusComponent.new(status: 'status'))
    end

    def active
      render(Searches::StatusComponent.new(status: 'active'))
    end

    def inactive
      render(Searches::StatusComponent.new(status: 'inactive'))
    end
    # @!endgroup
  end
end
