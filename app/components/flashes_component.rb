# frozen_string_literal: true

class FlashesComponent < BaseViewComponent
  attr_reader :flash

  def initialize(flash:, position: 'top-right')
    @flash = flash
    @position = position
  end

  def position
    case @position
    when 'top-right'
      'top-4 right-4'
    when 'bottom-right'
      'bottom-4 right-4'
    end
  end
end
