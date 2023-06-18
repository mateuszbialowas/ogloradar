# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :search
  enum external_service_name: { olx: 'olx' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at]
  end
end
