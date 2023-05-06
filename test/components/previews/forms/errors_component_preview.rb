# frozen_string_literal: true

module Forms
  class ErrorsComponentPreview < ViewComponent::Preview
    def default
      render(Forms::ErrorsComponent.new(resource: 'resource', method: 'method'))
    end
  end
end
