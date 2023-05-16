user = User.find_or_create_by(email: "user@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end


20.times do
  Product.create(
    external_id: FFaker::Guid.guid,
    product_url: FFaker::Internet.http_url,
    title: FFaker::Product.product_name,
    price: Random.rand(1000),
    thumbnail_url: FFaker::Image.url,
    external_service_name: "olx"
  )
end
