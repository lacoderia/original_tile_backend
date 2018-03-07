class AddShapeToTileTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :tile_types, :shape, :string, :default => "square"
  end
end
