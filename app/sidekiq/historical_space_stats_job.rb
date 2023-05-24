# frozen_string_literal: true

require 'sidekiq-scheduler'

class HistoricalSpaceStatsJob
  include Sidekiq::Worker
  def perform
    PgHero.capture_space_stats
  end
end
