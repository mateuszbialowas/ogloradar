# frozen_string_literal: true

class CustomBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  include InlineSvg::ActionView::Helpers
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  attr_accessor :output_buffer

  def render
    @elements.collect do |element|
      render_element(element)
    end.join(arrow_icon)
  end

  def render_element(element)
    element_to_html(element)
  end

  def element_to_html(element)
    current_element?(element) ? current_element_to_html(element) : other_element_to_html(element)
  end

  def current_element?(element)
    @context.current_page?(compute_path(element))
  end

  def current_element_to_html(element)
    @context.content_tag(:li, 'aria-current': 'page') do
      @context.content_tag(:div, class: 'flex items-center') do
        @context.content_tag(:span, compute_name(element),
                             class: 'ml-1 text-sm font-medium text-gray-500 underline md:ml-2 whitespace-nowrap')
      end
    end
  end

  def other_element_to_html(element)
    @context.content_tag(:li, class: 'inline-flex items-center') do
      @context.link_to(compute_path(element),
                       class: 'inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600') do
        compute_name(element)
      end
    end
  end

  def icon(element)
    icon = element.options[:icon]
    return inline_svg_tag("icons/breadcrumbs/#{icon}.svg", class: 'w-4 h-4 mr-2') if icon.present?

    arrow_icon
  end

  def arrow_icon
    inline_svg_tag('icons/breadcrumbs/separator.svg')
  end
end
