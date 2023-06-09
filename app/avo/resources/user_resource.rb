class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :text
  field :confirmation_token, as: :text
  field :confirmed_at, as: :date_time
  field :confirmation_sent_at, as: :date_time
  field :unconfirmed_email, as: :text
  field :admin, as: :boolean
  field :searches, as: :has_many
  # add fields here
end
