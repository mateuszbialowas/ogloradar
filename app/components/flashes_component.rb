# frozen_string_literal: true

class FlashesComponent < BaseViewComponent
  attr_reader :flash

  def initialize(flash:)
    @flash = flash
  end
end
