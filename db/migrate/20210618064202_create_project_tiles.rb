class CreateProjectTiles < ActiveRecord::Migration[5.0]
  def change
    create_table :project_tiles do |t|
      t.references :tile, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
