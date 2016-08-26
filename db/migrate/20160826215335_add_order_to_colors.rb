class AddOrderToColors < ActiveRecord::Migration[5.0]
  def change
    add_column :colors, :order, :integer
  end
end
