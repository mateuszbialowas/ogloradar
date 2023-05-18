# frozen_string_literal: true

user = User.find_or_create_by(email: 'user@example.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
  u.admin = true
  u.confirmed_at = Time.zone.now
end

search = Search.find_or_create_by(name: 'Olx Mieszkania',
                                  user:,
                                  uri: 'https://www.olx.pl/nieruchomosci/mieszkania/bialystok/?search%5Border%5D=created_at:desc&search%5Bfilter_float_price:from%5D=1500&search%5Bfilter_float_price:to%5D=4000')

20.times do
  Product.create(
    external_id: FFaker::Guid.guid,
    product_url: FFaker::Internet.http_url,
    title: FFaker::Product.product_name,
    price: Random.rand(1000),
    thumbnail_url: FFaker::Image.url,
    external_service_name: 'olx',
    search:
  )
end
