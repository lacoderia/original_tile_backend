class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :filename, :created_at, :tiles
  has_many :tiles
end
