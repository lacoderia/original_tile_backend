class TileSerializer < ActiveModel::Serializer
  attributes :id, :image, :tile_type, :active, :name, :xml

  def image
    object.image.url
  end

  def xml
    file = File.open(object.image.path, "rb")
    str = file.read
    file.close
    str.gsub!("\n","")
    str
  end
  
end
