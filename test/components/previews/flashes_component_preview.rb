# frozen_string_literal: true

class FlashesComponentPreview < ViewComponent::Preview
  def default
    flash = ActionDispatch::Flash::FlashHash.new
    flash[:info] = 'This is an info message.'
    flash[:success] = 'This is a success message.'
    flash[:error] = 'This is an error message.'
    flash[:alert] = 'This is an alert message.'
    render(FlashesComponent.new(flash:))
  end
end
