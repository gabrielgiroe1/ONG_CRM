class Avo::Resources::Company < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :centralized_task_management, as: :boolean
    field :monitoring_activity, as: :boolean
    field :generating_reports, as: :boolean
    field :data_storage, as: :boolean
    field :keeping_records, as: :boolean
    field :other, as: :text
    field :company, as: :text
    field :name, as: :text
    field :email, as: :text
    field :phone, as: :text
  end
end
