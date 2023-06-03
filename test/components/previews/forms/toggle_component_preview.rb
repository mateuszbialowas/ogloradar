# frozen_string_literal: true

module Forms
  class ToggleComponentPreview < ViewComponent::Preview
    include ActionView::Helpers::FormHelper
    attr_accessor :output_buffer

    def default
      f = ActionView::Helpers::FormBuilder.new(:form, nil, self, {})
      render(Forms::ToggleComponent.new(form: f, name: 'name', label: 'label', value: 'value'))
    end
  end
end
