# frozen_string_literal: true

module Searches
  class StatusComponent < BaseViewComponent
    attr_reader :status

    def initialize(status:)
      @status = status
    end

    def status_class
      case status
      when 'active'
        'bg-green-100 text-green-800 border-green-400'
      when 'inactive'
        'bg-red-100 text-red-800 border-red-400'
      end
    end
  end
end
