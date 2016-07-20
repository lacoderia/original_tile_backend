class AddNameToTiles < ActiveRecord::Migration[5.0]
  def change
    add_column :tiles, :name, :string
  end
end
