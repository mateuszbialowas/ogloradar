# frozen_string_literal: true

module Forms
  class LabelComponentPreview < ViewComponent::Preview
    def default
      render(Forms::LabelComponent.new(form: 'form', method: 'method'))
    end
  end
end
