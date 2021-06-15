class AddSkuToTiles < ActiveRecord::Migration[5.0]
  def change
    add_column :tiles, :sku, :string
  end
end
