# frozen_string_literal: true

class CustomBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  include InlineSvg::ActionView::Helpers
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  attr_accessor :output_buffer

  def render
    @elements.collect do |element|
      render_element(element)
    end.join(separator_icon)
  end

  def separator_icon
    @options[:separator_icon] || inline_svg_tag('icons/breadcrumbs/separator.svg')
  end

  def render_element(element)
    if element.path.nil? || @context.current_page?(compute_path(element))
      content_tag(:li) do
        content_tag(:div, class: 'flex items-center') do
          arrow_icon +
            content_tag(:span, compute_name(element), class: 'ml-1 text-sm font-medium text-gray-500 md:ml-2')
        end
      end
    else
      content_tag(:li, class: 'inline-flex items-center') do
        link_to(compute_path(element),
                class: 'inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600') do
          arrow_icon + compute_name(element)
        end
      end
    end
  end

  private

  def element_to_html(element)
    current_element?(element) ? current_element_to_html(element) : other_element_to_html(element)
  end

  def current_element?(element)
    @context.current_page?(compute_path(element))
  end

  def current_element_to_html(element)
    @context.content_tag(:li, 'aria-current': 'page') do
      @context.content_tag(:div, class: 'flex items-center') do
        arrow_icon +
          @context.content_tag(:span, compute_name(element),
                               class: 'ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400')
      end
    end
  end

  def other_element_to_html(element)
    @context.content_tag(:li, class: 'inline-flex items-center') do
      @context.link_to(compute_path(element),
                       class: 'inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white') do
        dashboard_icon + compute_name(element)
      end
    end
  end

  def arrow_icon
    inline_svg_tag('icons/breadcrumbs/separator.svg')
  end

  def dashboard_icon
    inline_svg_tag('icons/breadcrumbs/dashboard.svg')
  end
end
