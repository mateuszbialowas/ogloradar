# frozen_string_literal: true

require 'sidekiq-scheduler'

class OlxApiSchedulerJob
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform
    active_searches = Search.active
    active_searches.each do |search|
      Api::Olx::NewProductsNotification.new(search:).call
    end
  end
end
