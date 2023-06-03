# frozen_string_literal: true

class Forms::ToggleComponentPreview < ViewComponent::Preview
  def default
    render(Forms::ToggleComponent.new)
  end
end
