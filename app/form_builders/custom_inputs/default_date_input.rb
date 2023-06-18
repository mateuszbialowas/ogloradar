# frozen_string_literal: true

module CustomInputs
  class DefaultDateInput < SimpleForm::Inputs::Base
    def input(wrapper_options)
      @builder.date_field(attribute_name, wrapper_options).to_s.html_safe
    end
  end
end
