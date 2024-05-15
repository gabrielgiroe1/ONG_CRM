class Avo::Resources::Task < Avo::BaseResource
  self.includes = [:user]
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :description, as: :textarea
    field :status, as: :select, enum: ::Task.statuses
    field :user, as: :belongs_to, use_resource: Avo::Resources::CompactUser, update_using: -> { User.find(value).id }
  end
end
