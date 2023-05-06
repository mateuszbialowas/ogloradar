# frozen_string_literal: true

class Forms::ErrorsComponent < BaseViewComponent

  attr_reader :resource, :method

  def initialize(resource:, method:)
    @resource = resource
    @method = method.to_sym
  end

end
