# frozen_string_literal: true

class ProductsMailer < ApplicationMailer
  def created(user, products)
    @user = user
    @products = products.limit(10)

    mail to: user.email, subject: 'Nowe ogłoszenia'
  end
end
