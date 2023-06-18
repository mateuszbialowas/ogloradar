# frozen_string_literal: true

module Forms
  class SimpleFormComponentPreview < ViewComponent::Preview
    def default
      form = Forms::Form.new
      render '/forms/simple_form_component', form:
    end
  end
end
