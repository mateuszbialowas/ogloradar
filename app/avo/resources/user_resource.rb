# frozen_string_literal: true

class UserResource < Avo::BaseResource
  self.title = :email
  self.includes = []
  self.search_query = lambda {
    scope.ransack(id_eq: params[:q], email_cont: params[:q], m: 'or').result(distinct: false)
  }

  field :id, as: :id
  field :email, as: :text
  field :email, as: :gravatar, link_to_resource: true, as_avatar: true
  field :confirmed_at, as: :date_time
  field :admin, as: :boolean
  field :searches, as: :has_many
end
