class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :filename, :created_at, :tiles, :description
  has_many :tiles
end
