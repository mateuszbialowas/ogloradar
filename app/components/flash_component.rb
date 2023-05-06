# frozen_string_literal: true

class FlashComponent < BaseViewComponent
  attr_reader :type, :message

  def initialize(data:)
    @type = data[0]
    @message = data[1]
  end
end
