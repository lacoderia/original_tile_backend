class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :filename, :created_at
end
