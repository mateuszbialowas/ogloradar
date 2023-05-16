# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    external_id { FFaker::Guid.guid }
    product_url { FFaker::Internet.http_url }
    title { FFaker::Product.product_name }
    price { Random.rand(1000) }
    thumbnail_url { FFaker::Image.url }
    external_service_name { 'olx' }
  end
end
