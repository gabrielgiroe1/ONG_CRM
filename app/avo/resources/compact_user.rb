class Avo::Resources::CompactUser < Avo::BaseResource
  
  self.model_class = ::User
  self.find_record_method = -> {
    query.find(id)
  }
  # self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :email, as: :text
    field :personal_information, as: :heading
    field :first_name, as: :text
    field :last_name, as: :text
    field :birthday, as: :date
  end
end
