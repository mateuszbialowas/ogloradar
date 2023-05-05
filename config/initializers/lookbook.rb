# frozen_string_literal: true

return unless Rails.env.development?

Rails.application.configure do
  config.lookbook.project_name = 'OgloRadar'
  config.lookbook.ui_theme = 'blue'
end
