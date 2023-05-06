# frozen_string_literal: true

module Forms
  class EmailFieldComponent < BaseViewComponent
    attr_reader :form, :method, :value

    def initialize(form:, method:, value: nil)
      @form = form
      @method = method.to_sym
      @value = value
    end
  end
end
