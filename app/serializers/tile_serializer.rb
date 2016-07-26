class TileSerializer < ActiveModel::Serializer
  attributes :id, :image, :tile_type, :active, :name

  def image
    object.image.url
  end

  def xml
    file = File.open(object.image.path, "rb")
    file.read
  end
end
