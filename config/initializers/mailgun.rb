# frozen_string_literal: true

Mailgun.configure do |config|
  config.api_key = Rails.application.credentials.dig(:mailgun, Rails.env.to_sym, :api_key)
end
