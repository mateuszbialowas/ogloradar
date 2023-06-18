# frozen_string_literal: true

module Forms
  class SimpleFormComponentPreview < ViewComponent::Preview
    def default
      form = Forms::Form.new
      render '/forms/simple_form_component', form:
    end

    def with_errors
      form = Forms::Form.new
      Forms::Form::ALL_ATTRIBUTES.each do |attribute|
        form.errors.add(attribute, 'with error')
      end
      render '/forms/simple_form_component', form:
    end
  end
end
