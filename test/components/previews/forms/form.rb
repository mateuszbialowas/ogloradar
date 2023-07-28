# frozen_string_literal: true

module Forms
  class Form
    include ActiveModel::Model
    ALL_ATTRIBUTES = %i[full_name username password email description admin
                        super_admin creator created_at updated_at roles
                        animals animals_multiple].freeze

    attr_accessor(*ALL_ATTRIBUTES)
  end
end
