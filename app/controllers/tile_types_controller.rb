class TileTypesController < ApiController

  before_action :authenticate_user!
  
  def index
    begin
      tile_types = TileType.active
      render json: tile_types 
    rescue Exception => e
      tile = TileType.new
      tile.errors.add(:error_getting_tile_types, e.message)
      render json: ErrorSerializer.serialize(tile.errors), status: 500
    end
  end
end
