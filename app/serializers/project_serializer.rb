class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :filename
end
