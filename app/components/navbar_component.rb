# frozen_string_literal: true

class NavbarComponent < BaseViewComponent
  def initialize(current_user:)
    @current_user = current_user
  end

end
