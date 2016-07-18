module TileTypeSerializer

  def TileTypeSerializer.serialize(hash_tile_types)
    return if hash_tile_types.nil?

    json = {}
    tile_types = []
    hash_tile_types.each do |k, v|
      tile_types << { key: k, value: v }
    end
    json[:tile_types] = tile_types
    json
  end

end
