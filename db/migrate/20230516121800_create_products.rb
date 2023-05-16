# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :external_id, null: false, index: true
      t.string :product_url, null: false
      t.string :title, null: false
      t.string :price, null: false
      t.string :thumbnail_url, null: false
      t.string :external_service_name, null: false

      t.timestamps
    end

    add_index :products, %i[external_id external_service_name], unique: true
  end
end
