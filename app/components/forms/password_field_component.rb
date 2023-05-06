# frozen_string_literal: true

class Forms::PasswordFieldComponent < BaseViewComponent

    attr_reader :form, :method, :placeholder
  def initialize(form:, method:, placeholder:)
    @form = form
    @method = method.to_sym
    @placeholder = placeholder.to_s
  end

end
