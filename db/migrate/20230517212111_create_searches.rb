# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :name, null: false
      t.string :uri, null: false
      t.string :status, null: false, default: 'active'
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
