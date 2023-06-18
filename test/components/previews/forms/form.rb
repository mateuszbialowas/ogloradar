# frozen_string_literal: true

module Forms
  class Form
    include ActiveModel::Model

    attr_accessor :name, :email, :password
  end
end
