class JoinAdminUserRoles < ActiveRecord::Migration[5.0]
  def up
    create_table :admin_users_roles, :id => false do |t|
      t.references :admin_user, :role
    end
    add_foreign_key :admin_users_roles, :admin_users
    add_foreign_key :admin_users_roles, :roles
  end

  def down
    drop_table :admin_users_roles
  end
end
