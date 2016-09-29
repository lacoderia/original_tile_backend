class AddFilenameToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :filename, :string
  end
end
