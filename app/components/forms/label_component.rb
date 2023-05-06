# frozen_string_literal: true

module Forms
  class LabelComponent < BaseViewComponent
    attr_reader :form, :method, :label

    def initialize(form:, method:, label: nil)
      @form = form
      @method = method.to_sym
      @label = label.to_s
    end
  end
end
