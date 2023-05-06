# frozen_string_literal: true

class AddTermsAcceptedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :terms_accepted, :boolean, null: false, default: false
  end
end
