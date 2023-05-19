# frozen_string_literal: true

module Forms
  class TextFieldComponent < BaseViewComponent
    attr_reader :form, :method, :placeholder

    def initialize(form:, method:, placeholder:)
      @form = form
      @method = method
      @placeholder = placeholder
    end
  end
end
