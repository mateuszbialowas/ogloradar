# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'devise'
gem 'inline_svg'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'mailgun-ruby'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component'
# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'brakeman'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'erb_lint'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :staging do
  gem 'sentry-rails'
  gem 'sentry-ruby'
  gem 'sentry-sidekiq'
end

group :development do
  gem 'actioncable'
  gem 'hotwire-livereload'
  gem 'i18n_generators'
  gem 'i18n-tasks'
  gem 'letter_opener'
  gem 'listen'
  gem 'lookbook', '>= 2.0.0'
  gem 'rack-mini-profiler'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'vcr'
  gem 'webdrivers'
  gem 'webmock'
end
