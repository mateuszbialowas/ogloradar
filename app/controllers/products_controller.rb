# frozen_string_literal: true

class ProductsController < AuthenticatedController
  before_action :search, only: %i[index]

  def index # rubocop:disable Metrics/AbcSize
    add_breadcrumb "Wyszukiwanie: #{search.name}", search_path(search)
    add_breadcrumb 'Produkty'
    q = search.products.ransack(params[:q])
    q.sorts = 'created_at desc' if q.sorts.empty?
    pagy, products = pagy(q.result(distinct: true))
    render 'products/index', locals: { products:, search:, pagy:, q: }
  end

  private

  def search
    @search ||= policy_scope(Search).find(params[:search_id])
  end
end
