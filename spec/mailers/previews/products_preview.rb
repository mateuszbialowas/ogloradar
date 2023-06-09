# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/products
class ProductsPreview < BasePreview
  # Preview this email at http://localhost:3000/rails/mailers/products/notify_with_products

  def notify_with_products
    create(:search)
    ProductsMailer.notify_with_products(User.first, Product.all)
  end
end
