# frozen_string_literal: true

require 'sidekiq-scheduler'

class OlxApiSchedulerJob
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform
    active_searches = Search.active
    active_searches.each do |search|
      Api::Olx::NewProductsNotificationJob.perform_async(search.id)
    end
  end
end
