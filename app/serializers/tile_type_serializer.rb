module TileTypeSerializer

  def TileTypeSerializer.serialize(hash_tile_types)
    return if hash_tile_types.nil?

    json = {}
    tile_types = []
    hash_tile_types.each do |k, v|
      tile_types << { key: k, value: v[0], centimeters: v[1], inches: v[2] }
    end
    json[:tile_types] = tile_types
    json
  end

end
