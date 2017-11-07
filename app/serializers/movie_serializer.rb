class MovieSerializer < ActiveModel::Serializer
  attributes :available_inventory, :id, :inventory, :overview, :release_date, :title
end
