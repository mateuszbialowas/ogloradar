# frozen_string_literal: true

class ProductsMailer < ApplicationMailer
  def created(user, products)
    @user = user
    @products = products

    mail to: user.email, subject: 'Nowe ogłoszenia'
  end
end
