# frozen_string_literal: true

class Product < ApplicationRecord
  enum external_service_name: { olx: 'olx' }
end
