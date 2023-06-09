# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ogloradar
  class Application < Rails::Application
    config.autoload_paths += %W[#{config.root}/lib]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.exceptions_app = routes

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Warsaw'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :pl
    I18n.available_locales = %i[pl en]
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
