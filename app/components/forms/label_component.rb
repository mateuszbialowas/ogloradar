# frozen_string_literal: true

class Forms::LabelComponent < BaseViewComponent

    attr_reader :form, :method, :label
  def initialize(form:, method:, label:)
    @form = form
    @method = method.to_sym
    @label = label.to_s
  end

end
