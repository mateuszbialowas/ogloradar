# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :search
  enum external_service_name: { olx: 'olx' }
end
