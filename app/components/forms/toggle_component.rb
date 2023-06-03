# frozen_string_literal: true

module Forms
  class ToggleComponent < BaseViewComponent
    attr_reader :form, :name, :label, :value

    def initialize(form:, name:, label:, value:)
      @form = form
      @name = name
      @label = label
      @value = value
    end
  end
end
