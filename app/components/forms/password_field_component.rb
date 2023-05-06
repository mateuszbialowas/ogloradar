# frozen_string_literal: true

module Forms
  class PasswordFieldComponent < BaseViewComponent
    attr_reader :form, :method, :placeholder

    def initialize(form:, method:, placeholder: nil, autocomplete: 'new-password')
      @form = form
      @method = method.to_sym
      @placeholder = placeholder.to_s
    end
  end
end
