class TileSerializer < ActiveModel::Serializer
  attributes :id, :image, :tile_type, :active, :name, :xml, :created_at, :sku

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
      str.force_encoding("UTF-8")
    else
      ""
    end
  end

end
