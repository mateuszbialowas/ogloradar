# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    external_id { 'MyString' }
    product_url { 'MyString' }
    title { 'MyString' }
    price { 'MyString' }
    thumbnail_url { 'MyString' }
  end
end
