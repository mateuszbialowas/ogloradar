# frozen_string_literal: true

Rails.application.configure do
  config.view_component.component_parent_class = 'BaseViewComponent'
  config.view_component.capture_compatibility_patch_enabled = true
end
