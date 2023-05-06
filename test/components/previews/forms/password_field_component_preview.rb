# frozen_string_literal: true

class Forms::PasswordFieldComponentPreview < ViewComponent::Preview
  def default
    render(Forms::PasswordFieldComponent.new(form: "form", method: "method", placeholder: "placeholder"))
  end
end
