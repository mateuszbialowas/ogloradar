# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/products
class ProductsPreview < BasePreview
  # Preview this email at http://localhost:3000/rails/mailers/products/created

  def created
    search = create(:search)
    create_list(:product, 3, search:)
    ProductsMailer.created(User.first, Product.where(search:))
  end
end
