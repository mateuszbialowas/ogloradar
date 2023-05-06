# frozen_string_literal: true

class FlashComponentPreview < ViewComponent::Preview
  # @!group Sizes

  def notice
    render(FlashComponent.new(data: ['notice', 'This is an notice message.']))
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
