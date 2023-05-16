# frozen_string_literal: true

class SearchesController < ApplicationController
  def create
    uri = 'https://www.olx.pl/nieruchomosci/mieszkania/wynajem/bialystok/?search%5Border%5D=filter_float_price:asc&search%5Bfilter_float_price:from%5D=2000&search%5Bfilter_float_price:to%5D=4000&search%5Bfilter_enum_furniture%5D%5B0%5D=yes&search%5Bfilter_enum_rooms%5D%5B0%5D=two&search%5Bfilter_enum_rooms%5D%5B1%5D=three#836029813'
    Api::Olx::NewProductsNotification.new(uri:, current_user:).call
  end
end
