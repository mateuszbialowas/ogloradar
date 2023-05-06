# frozen_string_literal: true

class FlashComponentPreview < ViewComponent::Preview
  # @!group Sizes

  def info
    render(FlashComponent.new(data: ['info', 'This is an info message.']))
  end

  def success
    render(FlashComponent.new(data: ['success', 'This is a success message.']))
  end

  def error
    render(FlashComponent.new(data: ['error', 'This is an error message.']))
  end

  def alert
    render(FlashComponent.new(data: ['alert', 'This is an alert message.']))
  end

  # @!endgroup
end
