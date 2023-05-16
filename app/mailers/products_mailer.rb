# frozen_string_literal: true

class ProductsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.products_mailer.created.subject
  #
  def created(user, products)
    @user = user
    @products = products.limit(10)

    mail to: user.email, subject: 'Nowe ogłoszenia'
  end
end
