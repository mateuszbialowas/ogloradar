# frozen_string_literal: true

class NavbarComponentPreview < ViewComponent::Preview
  def default
    render(NavbarComponent.new(current_user: "current_user"))
  end
end
