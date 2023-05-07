# frozen_string_literal: true

module Mailers
  class BaseComponentPreview < ViewComponent::Preview
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::TagHelper
    attr_accessor :output_buffer

    def default
      render(Mailers::BaseComponent.new)
    end

    def with_slots
      render Mailers::BaseComponent.new do |component|
        component.with_header do
          'Header 👋'
        end
        component.with_body do
          'Body'
        end
        component.with_footer do
          'Footer'
        end
      end
    end
  end
end
