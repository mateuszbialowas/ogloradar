# frozen_string_literal: true

class ProductsMailer < ApplicationMailer
  def notify_with_products(user, products)
    @user = user
    @products = products

    mail to: user.email, subject: 'Nowe ogłoszenia'
  end
end
