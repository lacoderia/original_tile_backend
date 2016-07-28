class TileSerializer < ActiveModel::Serializer
  attributes :id, :image, :tile_type, :active, :name, :xml

  def image
    if object.try(:image)
      object.image.url
    else
      ""
    end
  end
  
  def xml
    if object.image.try(:path)
      file = File.open(object.image.path, "rb")
      str = file.read
      file.close
      str.gsub!("\n","")
      str
    else
      ""
    end
  end

end
