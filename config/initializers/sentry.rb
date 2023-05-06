# frozen_string_literal: true

return unless Rails.env.staging?

require 'sentry-rails'
Sentry.init do |config|
  config.dsn = Rails.credentials.dig(:sentry, Rails.env.to_sym, :dsn)
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
