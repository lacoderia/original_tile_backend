class TileSerializer < ActiveModel::Serializer
  attributes :id, :image, :tile_type, :active, :name

  def image
    object.image.url
  end
end
