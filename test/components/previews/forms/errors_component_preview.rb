# frozen_string_literal: true

class Forms::ErrorsComponentPreview < ViewComponent::Preview
  def default
    render(Forms::ErrorsComponent.new(resource: "resource", method: "method"))
  end
end
