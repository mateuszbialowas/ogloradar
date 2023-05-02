# frozen_string_literal: true

Rails.application.configure do
  config.view_component.generate.stimulus_controller = true
  config.view_component.generate.sidecar = true
end
