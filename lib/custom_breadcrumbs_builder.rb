class CustomBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  include InlineSvg::ActionView::Helpers
  def render
    @elements.collect do |element|
      render_element(element)
    end.join(separator_icon)
  end

  def separator_icon
    @options[:separator_icon] || inline_svg_tag('icons/breadcrumbs/separator.svg')
  end

  def render_element(element)
    if element.path == nil
      # render 'shared/breadcrumbs/element', element: element
      content = compute_name(element)
    else
      "sadff"
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
    @context.content_tag(:li, "aria-current": "page") do
      @context.content_tag(:div, class: "flex items-center") do
        arrow_icon +
          @context.content_tag(:span, compute_name(element), class: "ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400")
      end
    end
  end

  def other_element_to_html(element)
    @context.content_tag(:li, class: "inline-flex items-center") do
      @context.link_to(compute_path(element), class: "inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white") do
        home_icon + compute_name(element)
      end
    end
  end

  def arrow_icon
    @context.content_tag(:svg, "aria-hidden": "true", class: "w-6 h-6 text-gray-400", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg") do
      @context.content_tag(:path, fill_rule: "evenodd", d: "M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z", clip_rule: "evenodd")
    end
  end

  def home_icon
    @context.content_tag(:svg, "aria-hidden": "true", class: "w-4 h-4 mr-2", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg") do
      @context.content_tag(:path, d: "M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z")
    end
  end

end
