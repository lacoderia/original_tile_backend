class CreateTileTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :tile_types do |t|
      t.string :key
      t.string :value
      t.float :centimeters
      t.float :inches
      t.boolean :active

      t.timestamps
    end
  end
end
