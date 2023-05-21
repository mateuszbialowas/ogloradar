# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def update_flashes_component(flash:)
    turbo_stream.update('flashes_component') do
      render FlashesComponent.new(flash:, position: 'bottom-right')
    end
  end
end
