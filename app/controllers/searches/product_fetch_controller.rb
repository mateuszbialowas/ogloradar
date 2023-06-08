# frozen_string_literal: true

module Searches
  class ProductFetchController < AuthenticatedController
    def create
      result = Searches::ProductFetch.new(current_user:, search_id: params[:search_id]).call
      if result.success?
        flash[:notice] = 'Wyszukiwanie rozpoczęte. Powiadomimy Cię o nowych ogłoszeniach.'
      else
        flash[:alert] = result.message
      end
      render 'searches/product_fetch/create'
    end
  end
end
