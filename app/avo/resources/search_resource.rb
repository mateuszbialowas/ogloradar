# frozen_string_literal: true

class SearchResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = lambda {
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: 'or').result(distinct: false)
  }

  field :id, as: :id
  field :name, as: :text
  field :uri, as: :text, only_on: :show
  field :status, as: :select, enum: ::Search.statuses, hide_on: [:show, :index], placeholder: 'Choose the status.'
  field :status, as: :badge, options: { success: 'active', danger: 'inactive' }
  field :user, as: :belongs_to
  field :products_count, as: :number do |search|
    search.products.count
  end
end
