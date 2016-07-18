class TilesController < ApiController

  before_action :authenticate_user!

  def tile_types
    begin
      hash_tile_types = Tile.tile_types
      render json: TileTypeSerializer.serialize(hash_tile_types)
    rescue Exception => e
      tile = Tile.new
      tile.errors.add(:error_getting_tile_types, e.message)
      render json: ErrorSerializer.serialize(tile.errors), status: 500
    end
  end

  def by_tile_type
    begin
      tiles = Tile.active.by_tile_type(params[:tile_type])
      render json: tiles
    rescue Exception => e
      tile = Tile.new
      tile.errors.add(:error_getting_tiles, e.message)
      render json: ErrorSerializer.serialize(tile.errors), status: 500
    end
  end
end
