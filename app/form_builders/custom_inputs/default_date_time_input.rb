# frozen_string_literal: true

module CustomInputs
  class DefaultDateTimeInput < SimpleForm::Inputs::Base
    def input(wrapper_options)
      @builder.datetime_field(attribute_name, wrapper_options).to_s.html_safe
    end
  end
end
