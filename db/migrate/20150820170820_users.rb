class Users < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :salt_password
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
