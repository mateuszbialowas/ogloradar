# frozen_string_literal: true

class FlashComponentPreview < ViewComponent::Preview
  def default
    render(FlashComponent.new(type: "type", message: "message"))
  end
end
