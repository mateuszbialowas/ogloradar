# frozen_string_literal: true

module Mailers
  class BaseComponent < BaseViewComponent
    renders_one :header
    renders_one :body
    renders_one :footer
  end
end
