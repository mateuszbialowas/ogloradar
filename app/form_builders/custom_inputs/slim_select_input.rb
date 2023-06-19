# frozen_string_literal: true

module CustomInputs
  class SlimSelectInput < SimpleForm::Inputs::CollectionSelectInput
    def input(wrapper_options = nil)
      label_method, value_method = detect_collection_methods

      # merged_input_options = merge_wrapper_options(input_html_options.merge(data: { controller: 'slim-select-input' }),
      #                                              wrapper_options)
      merged_input_options = merge_wrapper_options({ class: nil, data: { controller: 'slim-select-input' } }, wrapper_options.except(:class))


      @builder.collection_select(
        attribute_name, collection, value_method, label_method,
        input_options, merged_input_options
      )
    end
  end
end
