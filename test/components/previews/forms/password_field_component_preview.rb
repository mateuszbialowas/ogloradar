# frozen_string_literal: true

module Forms
  class PasswordFieldComponentPreview < ViewComponent::Preview
    def default
      render(Forms::PasswordFieldComponent.new(form: 'form', method: 'method', placeholder: 'placeholder'))
    end
  end
end
