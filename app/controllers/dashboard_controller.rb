# frozen_string_literal: true

class DashboardController < AuthenticatedController
  def index
    searches = policy_scope(Search)
    products = policy_scope(Product)

    render 'dashboard/index', locals: { searches:, products: }
  end
end
