class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :job_title, :string
    add_column :users, :business_type, :string
    add_column :users, :type_of_installation, :string
    add_column :users, :about_us, :string
    add_column :users, :project_references, :string
    add_column :users, :designs_quantities, :string
    add_column :users, :complete_delivery_address, :text
    add_column :users, :message, :text
  end
end
