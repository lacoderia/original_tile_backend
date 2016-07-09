class CreateTiles < ActiveRecord::Migration[5.0]
  def change
    create_table :tiles do |t|
      t.string :url
      t.string :tile_type
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
