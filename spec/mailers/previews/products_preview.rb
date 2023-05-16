# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/products
class ProductsPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/products/created
  def created
    ProductsMailer.created(User.first, Product.all)
  end
end
