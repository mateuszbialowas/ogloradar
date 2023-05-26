# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    pagy, products = pagy(Search.find(params[:search_id]).products)
    render 'products/index', locals: { products:, pagy: }
  end
end
