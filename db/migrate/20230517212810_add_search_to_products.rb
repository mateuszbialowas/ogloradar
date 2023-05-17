# frozen_string_literal: true

class AddSearchToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :search, null: false, foreign_key: true # rubocop:disable Rails/NotNullColumn
  end
end
