# frozen_string_literal: true

class CustomFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    default_class = 'block text-sm font-medium text-red-700'
    options = options.merge(class: "#{default_class} #{options[:class]}")
    super(attribute_name, options.merge, &block)
  end

  def label(attribute_name, options = {}, &block)
    default_class = 'block text-sm font-medium text-red-700'
    options = options.merge(class: "#{default_class} #{options[:class]}")
    super(attribute_name, options.merge, &block)
  end


end
