# frozen_string_literal: true

class Forms::EmailFieldComponentPreview < ViewComponent::Preview
  def default
    # TODO: Add default preview
    render(Forms::EmailFieldComponent.new(form: "form", method: "method"))
  end
end
