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
end
