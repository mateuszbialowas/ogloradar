# frozen_string_literal: true

class SearchResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :uri, as: :text
  field :status, as: :select, enum: ::Search.statuses
  field :user_id, as: :number
  field :user, as: :belongs_to
  field :products, as: :has_many
  # add fields here
end
