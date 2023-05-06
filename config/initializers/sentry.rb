# frozen_string_literal: true

return unless Rails.env.staging?

require 'sentry-rails'
Sentry.init do |config|
  config.dsn = 'https://20591b4f23b04f8b9ddebe4e8fdf2bab@o4503994140655616.ingest.sentry.io/4505139644334080'
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
