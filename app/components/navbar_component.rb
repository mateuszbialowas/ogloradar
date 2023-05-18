# frozen_string_literal: true

class NavbarComponent < BaseViewComponent
  attr_reader :current_user

  def initialize(current_user:)
    @current_user = current_user
  end

  def render?
    current_user.present?
  end
end
