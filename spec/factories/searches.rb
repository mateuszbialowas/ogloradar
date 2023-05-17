# frozen_string_literal: true

FactoryBot.define do
  factory :search do
    name { FFaker::Lorem.word }
    uri { 'MyString' }
    status { 'active' }
    user { create(:user) }
  end
end
