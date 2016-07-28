class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.integer :user_id
      t.string :email_status
      t.string :email_type

      t.timestamps
    end
  end
end
