# frozen_string_literal: true

class HelloWorldJob
  include Sidekiq::Worker

  def perform
    Rails.logger.debug 'Hello world'
  end
end
