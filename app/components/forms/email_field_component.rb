# frozen_string_literal: true

class Forms::EmailFieldComponent < BaseViewComponent
  attr_reader :form, :method
  def initialize(form:, method:)
    @form = form
    @method = method.to_sym
  end

end
