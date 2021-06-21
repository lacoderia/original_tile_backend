class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :filename, :created_at, :tiles, :description, :tiles

  def tiles
    tile_array = []
    if not object.tiles.empty?
      tile_array = object.tiles.map do |tile|
        {
          id: tile.id,
          name: tile.name,
          sku: tile.sku,
          tile_type: {
            key: tile.tile_type.key,
            value: tile.tile_type.value,
            centimeters: tile.tile_type.centimeters,
            inches: tile.tile_type.inches,
            shape: tile.tile_type.shape
          }
        }
      end
    end
    tile_array
  end
end
