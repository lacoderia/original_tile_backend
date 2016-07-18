class TileSerializer < ActiveModel::Serializer
  attributes :id, :url, :tile_type, :active
end
